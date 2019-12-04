Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9C1137B7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 23:41:53 +0100 (CET)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icdLE-0001TQ-PZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 17:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1icdIZ-0008Pi-Ri
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 17:39:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1icdIW-0007Ab-Bo
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 17:39:05 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35371)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1icdIW-00075t-2C
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 17:39:04 -0500
Received: by mail-wr1-x443.google.com with SMTP id g17so1171375wro.2
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2019 14:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Dc+UYaloBsF1r9t5DxQaHhh9Soj/LFIPOXdO5MmMv44=;
 b=bPrp3ZvXj3P+UkM9afxchEsrsi9NtWTUNRBmx6aNywkpSe/Wvsy1BBaWyELBciWDja
 Op5X/qpoVGT2TawV4r6RW5zQOP/LQ6Z9vBUgdVdv+zi9r8ZwzX0I9x2ncHghUKJwcC5W
 DMWud/PVcn8y1LnP5NQ9BjLcgrmihTLmVbdIYflnVCxGLznnWK4gdW0+gwHZW2coh5/X
 TyUFpDWeYCri4MBNec69fSWlTEKkrq8WdJCd/9NqLX97J4j6mZxHixGObF74env45zzu
 7VTR0kpvuLu6+rU48NENjUWLUSQ5biB8A5wipiW/9R8oQJUHvqRphFcdEm+lH8a8GJq1
 dDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Dc+UYaloBsF1r9t5DxQaHhh9Soj/LFIPOXdO5MmMv44=;
 b=ASsrp1iWxMTWq9x4HLSFjpuZ5uv1dnyhHOOSJnoYdpnBCQ6+hZdqj7Gc+j/XpV/hM6
 vDaHfhfNxiOg5F0PHdPRSMyNLn7jBcf0OqgL9L0c9Tw2M883S3Y9WyWXjypVoYZ9NfO5
 FMNFkD8+9akGCD6yMn5dgwP08e23lElwwCS3EvUSkhqz/ONhd9HZX6CfOQTGS6CJa2ok
 ZqmG1oOtMLL8KxOkXANC8ShKOfU5geQEH++9iCmpPalo75obXTvKrtROPiwJzwjV1t8T
 8stNr86DgQXp2EEhvRQKDL+wkyRyWP0jTyiYID5xlF0KcAkE4IgidLfOhqKDkqF3IR2W
 +7/g==
X-Gm-Message-State: APjAAAUckVhMTpPXoqmZsf889EZ0XDiA0EmLS6B6/KBoMDe9kqiV0VK3
 V70F+n2pR6iAHj/6vhbJYU5VTA==
X-Google-Smtp-Source: APXvYqwpHZRKI+iPU0Fu4c15buohP79arXZUYwp12ECMNj2cTa/wooE631UoSMTCjBwCURj55N95GA==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr6969549wrs.276.1575499140406; 
 Wed, 04 Dec 2019 14:39:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm10008168wrr.35.2019.12.04.14.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 14:38:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF2131FF87;
 Wed,  4 Dec 2019 22:38:57 +0000 (GMT)
References: <20191203022937.1474-1-richard.henderson@linaro.org>
 <20191203022937.1474-27-richard.henderson@linaro.org>
 <87tv6f7w9u.fsf@linaro.org>
 <37abfbf0-be00-db96-fbf5-b6d6ea7bb237@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 26/40] target/arm: Update
 define_one_arm_cp_reg_with_opaque for VHE
In-reply-to: <37abfbf0-be00-db96-fbf5-b6d6ea7bb237@linaro.org>
Date: Wed, 04 Dec 2019 22:38:57 +0000
Message-ID: <87r21j7m2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/4/19 10:58 AM, Alex Benn=C3=A9e wrote:
>>> @@ -7437,13 +7437,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *=
cpu,
>>>              mask =3D PL0_RW;
>>>              break;
>>>          case 4:
>>> +        case 5:
>>>              /* min_EL EL2 */
>>>              mask =3D PL2_RW;
>>>              break;
>>> -        case 5:
>>> -            /* unallocated encoding, so not possible */
>>> -            assert(false);
>>> -            break;
>>=20
>> This change is fine - I don't think we should have asserted here anyway.
>> But don't we generate an unallocated exception if the CPU is v8.0?
>
> This change is only for validation of the system registers themselves.  I=
t has
> nothing to do with the usage of system registers from the actual guest.

So what is the mechanism that feeds back to the translator?
access_check_cp_reg only seems to care about XSCALE. I guess
cp_access_ok would trip if you weren't at EL2 but what if you are a v8.0
at EL2?

--=20
Alex Benn=C3=A9e

