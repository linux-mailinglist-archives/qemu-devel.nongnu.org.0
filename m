Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018F883CA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 22:22:37 +0200 (CEST)
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwBPI-0006QU-Ac
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 16:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hwBOo-0005uz-4M
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 16:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hwBOn-0001VM-3v
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 16:22:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54431)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hwBOm-0001Uw-Tb
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 16:22:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so6842863wme.4
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 13:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfFUisYao/CObVSSiozPR0j1fe4VzwBjemIAiGRc/3I=;
 b=rhiVcwAdwIo9p5Qx9DoQG863iEInVawPk8ooILS0cA7WlVgJYd8rd8U1uYc1rdB3Yb
 0+JDEyN+RWVE1sz2uybESoGflIN4P/CgV4eYGhdGg6XzfsPgIPl+WMI2LufsVeXRU8dD
 Lj/jzeHjkMaHxyLkMNNSPWS/K1EVL3nvGLmBomG7/J2WL6o0ZHqrnG4MqyCud/3PzPJ5
 VqtUlQosQhYDSs+PkVQbBzlQ2GypGQKxWNZwIkrQP8i54n/Fimf06hvNlyUaT+yDggzy
 0sN25v4LElZG8Ivkokx3N5IFQt5dvjySjC98dz+o4pOxhwiGRqK1qt3+mrSOtVh9xo3n
 aRyg==
X-Gm-Message-State: APjAAAWMm/GUKSgBAGc2u/iIDIsroXGlwSmA5Zo73KYEOKWTSpm1kzmX
 /pIVZoZh8oxMRVItenNJzVUjpw==
X-Google-Smtp-Source: APXvYqwaWOyDjiD1e3P7VI2ZmVGax+mPdqfK2xNPEp0Ydmc8ANaeAnkP69uvjNyAmvCXKGcGA3NQ6g==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr12368266wmd.22.1565382123803; 
 Fri, 09 Aug 2019 13:22:03 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id 15sm4585995wmk.34.2019.08.09.13.22.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 13:22:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190701194942.10092-1-philmd@redhat.com>
 <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <07662a67-b4cf-e681-fffa-98a03a26e0fb@redhat.com>
Date: Fri, 9 Aug 2019 22:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v4 0/8] Support disabling TCG on ARM
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
Cc: Yang Zhong <yang.zhong@intel.com>, Andrew Jones <drjones@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Paolo, Alex, Thomas :)

On 7/2/19 4:08 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 20:49, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
[...]
>> $ git backport-diff -u v3 -r target-arm.next..v4
>> Key:
>> [----] : patches are identical
>> [####] : number of functional differences between upstream/downstream patch
>> [down] : patch is downstream-only
>> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
>>
[skipping patches already applied...]

>> 004/8:[----] [--] 'RFC target/arm: Restrict pre-ARMv7 cpus to TCG'
>> 005/8:[----] [--] 'RFC target/arm: Do not build pre-ARMv7 cpus when using KVM'
>> 006/8:[----] [--] 'RFC target/arm: Restrict R and M profiles to TCG'
>> 007/8:[----] [--] 'RFC target/arm: Do not build A/M-profile cpus when using KVM'
>> 008/8:[----] [--] 'target/arm: Do not build TCG objects when TCG is off'
> 
> I'm going to apply patches 1 and 2 to target-arm.next for rc0 (since
> 2 is helpful to redhat downstream and taking 1 now reduces the
> amount of code-movement patches you'll need to rebase). Patch 3
> doesn't compile and 4-8 are rfc.

The remaining patches can be applied without conflict, so no need to
respin (yet) IMO.

Paolo/Thomas, do you mind reviewing patches 5 and 7? They are kconfig
related.

Peter/Alex, do you mind reviewing patches 4 and 6 first, then 5 and 7 (5
and 7 can wait for Paolo/Thomas' review first).

Thanks!

Phil.

