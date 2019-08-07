Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A51F85047
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 17:50:37 +0200 (CEST)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvOCy-0001Eb-J0
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 11:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59113)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB3-0007Rd-1I
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB2-0008Km-0p
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:48:36 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOB1-0008K5-QA
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 11:48:35 -0400
Received: by mail-pl1-x641.google.com with SMTP id b7so41476021pls.6
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=IK+EC8rxSLj6GnhhMqmFSBOePtP4VGVXguG7qL48rfGiQnzRq4ct9g7jz1KwQ+ZFNw
 CTnE50cpiGbWhKHIInyj7AxKpvzUGkGykuEnQgWG2IUbKeaN+ems8FkmPgx8Ex4+kFD1
 tXsycNBHqgk3W/q+TgXl55usAJSoLowUlCU2OM5Tcpx4HYLD9DkQT0JoOSsPf+/CYexH
 EOSw7eT9wff9WPsOs2RP8iAVYrjEOazEnOEHMSWcdNjcEyyqbuRCDO4fapIWJH9RH7NM
 y7JsyIccajdyh5IN5l8M/xTx3F+rCeNU03PdY3Adi3YNmEwkoqo6YHXnsghfPoYxwQT2
 GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=giRw9PTRElA+i8U6WOUt3PD7Q60ng/rhLW9ydjXHcjEuBIb+N+OXVzOaDa2h0sBc4L
 P9tlUhyjkrFZBzAP6atVEqhiJjRyav9A3FzPIXxSl525tkXBxnAAL0i2ncq5yr2SEHL2
 yRNojBIh5tNrI9wY79fxFsXOGdnwC4YfavKAWjF2M43/vKnVIHWTFJBN4ENkSZ7yyp+q
 fJQcXZngbxJKS4YmSlS4qpbAOtaw3FySmeRZlci9TFo8Zs1XrgXkk8nNiKnT2Befk7sK
 YIEco3tUwEhFuOr2BBhApReoAk3Q0pC5tzGaeOICDG1OOzgDX9pkCZTJ/am+a++kmszM
 ZfdQ==
X-Gm-Message-State: APjAAAXZLct7P2eXsSSWvkkWB/krlRk9oNHpFeO8fzOEx2+iTDtzXDoK
 5FMELCXz1nK29owO/kbzGpLerg==
X-Google-Smtp-Source: APXvYqyNog3De3+XAOQ8+7tLtpVuHhFeBrAofS85n6QRADl8JNRs6vEyXF5uH0HNH0kJXkAI1KBdEg==
X-Received: by 2002:a62:5253:: with SMTP id g80mr9900905pfb.179.1565192914835; 
 Wed, 07 Aug 2019 08:48:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f14sm10154655pgu.8.2019.08.07.08.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:48:33 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166644883.25395@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc5dbc6e-c690-35fa-8090-2b695891a02a@linaro.org>
Date: Wed, 7 Aug 2019 08:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166644883.25395@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH v6 14/26] exec: Hard code size with
 MO_{8|16|32|64}
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/19 1:30 AM, tony.nguyen@bt.com wrote:
> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with
> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  memory_ldst.inc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



