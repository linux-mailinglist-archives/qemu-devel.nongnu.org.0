Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3665E83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:27:40 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlcr5-0001cR-Qe
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33193)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlcqu-0001DW-9O
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlcqs-0008PH-AY
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:27:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlcqq-0008Mt-9A
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:27:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so6462781wmj.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 10:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yO1sVfSkD66Za17PbFJm0jKswKayheW9pPIfZ1g9g0M=;
 b=GSDHDrXkdXzBRxFb9y9ue+BJomNXXUbZfe9WayCzUnlNBkOWkUFmmUJKQ367fOdNvX
 z4kjgfXIMpGt1OXeqGfoBCImAJwL66uKrVhllNZpW4dM4oJtGJF/AfsqdaZEkJiq9oRn
 cCfHQZT1QMFxSXrgLLPcS2x4mPlFVZbKclLv1svHiSVWnAgC92yamu1sY7qEYCIQnJcx
 tUPpCdAd2CHovQGwZchqbL8lGwdhXly9cPskN7gM02aUhnIUF/L4rSYVpt4uepudZ2cL
 SXtEDTxAhfF/NvXJdrjU63H9v66UZZHv9isCpJ7/LKxnUVMH0ozT7+loqu1O6VdkZvaR
 CN8g==
X-Gm-Message-State: APjAAAXxP9tZrwzAz5pOo7bYFiRzEu8C+RuX0WbJPwqDdBiYUzRpqiIb
 LPpuiHGGnPLhEvpzTRnXbkcspA==
X-Google-Smtp-Source: APXvYqx8KI07GrT6NEmbPmphqRvGt4b6iNnncRRuBpdsEsmCKeO8h6PRw0o7xlHVpOeQipnTuCTgBQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr5334642wma.41.1562866041534; 
 Thu, 11 Jul 2019 10:27:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id x83sm5924039wmb.42.2019.07.11.10.27.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:27:20 -0700 (PDT)
To: Liran Alon <liran.alon@oracle.com>
References: <20190705210636.3095-1-liran.alon@oracle.com>
 <20190705210636.3095-2-liran.alon@oracle.com>
 <805d7eb5-e171-60bb-94c2-574180f5c44c@redhat.com>
 <901DE868-40A4-4668-8E10-D14B1E97BAE0@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <365df187-07b9-77ba-f5ef-35d0330aa914@redhat.com>
Date: Thu, 11 Jul 2019 19:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <901DE868-40A4-4668-8E10-D14B1E97BAE0@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH 1/4] target/i386: kvm: Init nested-state
 for VMX when vCPU expose VMX
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
Cc: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/19 16:36, Liran Alon wrote:
> Will you submit a new patch or should I?

I've just sent it, I was waiting for you to comment on the idea.  I
forgot to CC you though.

Paolo

