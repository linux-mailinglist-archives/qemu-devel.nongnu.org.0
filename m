Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064B60D2E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 23:34:10 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjVqL-0001um-If
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 17:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47812)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hjVoS-0000rT-Dq
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 17:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hjVoR-00056s-9J
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 17:32:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hjVoQ-00055r-VV
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 17:32:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so4730116wme.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 14:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXAZsZeL7QsQEuCCkFmyg+1v547nYOhI7Xx0Bjhq8eM=;
 b=FjOPxbaaKUFr4YRfikXxsMSlrYps8y3uRPR4rQy5Xy+jvJvzY6EsMllDEhCKHCl3ad
 PKSgtNYpBonbUkB/aNQIwH2BiLUhuhG9c60CTqkC+LSwwb5yyNzXdWIpoKsXFynBFv3V
 kVDy3KF3UToKRzZ9NDeRlbjQOFKHH2UnsOTb0WJJoH7hp6eOGnr3L8CfQrGZJsOr4YP8
 Q72EcGKMweSHCvco0b0iCFzyvP2V88PMFT+/B+pEi5yOuN/kx6aJAxLBATb1uFtFCvv5
 XeTyN/x0Jm0gsjdFMQpoC45oWpeYr0ypKpdz04Pibl6AzRuCCPrIPXV36pwskHpKywpz
 vxtg==
X-Gm-Message-State: APjAAAV4qaji0Ut4pi9LVAe0XSD7I0tPDyGHUmOJFv3ffvAP4gErnu/b
 dr1Dx9msprET5Gnqhdz1LdxOLg==
X-Google-Smtp-Source: APXvYqy51QTrQiJ8i5mxqvDOUx/TW/I3DfyX3hdwE1ivAX52NUnEfdFKvlAvHWgiRmW92RZ4P+oOyw==
X-Received: by 2002:a1c:305:: with SMTP id 5mr4852657wmd.101.1562362329869;
 Fri, 05 Jul 2019 14:32:09 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o185sm9912095wmo.45.2019.07.05.14.32.08
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 14:32:08 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
 <1562079681-19204-2-git-send-email-pbonzini@redhat.com>
 <20190705203728.GE5198@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c1f3a3f-c59d-9866-7fc9-3d9c99af17e5@redhat.com>
Date: Fri, 5 Jul 2019 23:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705203728.GE5198@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 1/7] target/i386: handle filtered_features
 in a new function mark_unavailable_features
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Liran Alon <liran.alon@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/19 22:37, Eduardo Habkost wrote:
> Filtering and reporting is separate because
> x86_cpu_filter_features() is also called from a QMP command
> handler that is not supposed to generate any warnings on stderr
> (query-cpu-model-expansion).

But that one should not set check_cpuid or enforce_cpuid, should it?

(I can still split the filtering and reporting if you prefer).

Paolo

