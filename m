Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B57F23F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 11:48:05 +0200 (CEST)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htUAP-0005TH-5V
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1htU9d-000528-V5
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1htU9d-0005PS-2w
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:47:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1htU9c-0005PE-So
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:47:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id y4so76510050wrm.2
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 02:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eOHfF/rCXX8j3COEy4gUW6GLuCIIdeidIgLhcd/eoX8=;
 b=gtEBSq/yj0VrFxx6kTXpDO9ZSrLY3+ZLfo0xnTJ26xoLQv6SKoa3sVoD7l6vWwVPgd
 gjtTNyxQepJYxcYWcDyUku8Xv4fxQXRJG+XjZqeqUuszdSuE4ShoQPIbN6HWKrJmCLfs
 Tm1KGSZRIX4FoeTp5F+5CdGi7n4fsICb97yIHm6PsxF8SnNEgz7e7rOHUO/cbeO0fCX7
 GTam4qldEsjXzfUWMdL0HQyCWecnCEJDsFsW37KnHkrwvU1DL3Rr82kc7qGdXcwuurXk
 FrPyghfpLtw2wzuIgClAGaq/vuDzUqeQtEaw/w1HjPsH/fBQFneVFu0cUPLtvA4EKSzO
 +Kfg==
X-Gm-Message-State: APjAAAVyCBmfdACkTlVslS+2NucLFahFGBZPWv8JNbApo3n20DQDG1of
 2nb1hdaXvBAMr832Zt9zb+w6RAFmGLo=
X-Google-Smtp-Source: APXvYqzkTlvRwR56If4+2dX5tttQ4iO+xfkhkr9D3YB177w9ELRZclb1M0UYC1o6tFR/N+9GEL+h/g==
X-Received: by 2002:adf:b195:: with SMTP id q21mr2462133wra.2.1564739235535;
 Fri, 02 Aug 2019 02:47:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4013:e920:9388:c3ff?
 ([2001:b07:6468:f312:4013:e920:9388:c3ff])
 by smtp.gmail.com with ESMTPSA id s10sm90455911wmf.8.2019.08.02.02.47.14
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 02:47:14 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190726120542.9894-1-armbru@redhat.com>
 <20190726120542.9894-15-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e375113c-8cf2-6f82-3fe2-618bb306d14b@redhat.com>
Date: Fri, 2 Aug 2019 11:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726120542.9894-15-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH 14/28] migration: Move the
 VMStateDescription typedef to typedefs.h
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/19 14:05, Markus Armbruster wrote:
>  typedef struct VMStateInfo VMStateInfo;
> -typedef struct VMStateDescription VMStateDescription;
>  typedef struct VMStateField VMStateField;

This certainly qualifies for typedefs.h.

Paolo

