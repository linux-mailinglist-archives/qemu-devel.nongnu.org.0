Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A570D20CF3B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 16:45:43 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpv2U-0006Vy-BD
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpuy5-00031T-QK
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:41:09 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpuy4-0001FI-1B
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 10:41:09 -0400
Received: by mail-wm1-x344.google.com with SMTP id q15so15631648wmj.2
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ATLAiO8uoee8c66oqfYdT1Zfnhx9V+nSe7jkQWl7mV0=;
 b=K330bgeW0TDh21sMdpaz5yV0p/OaAEHCzcgPusDNd/yVD5pFKIGY8krE7ignaTqVxm
 6wmnVtiAP2MwLAsDwIRPA2po76+sEQFRlire4wRnc6Um4oYejrpWJPxbDHG0YQKtNK4v
 OXTMB+qw/CAoMPqf2brk/2Xl9oWXf0iQA5McKEVWnUdd2WdwQXRNCOg3yKImXmBZMcDK
 2zcd/DOjl7w+OAbYKQdnUXQty8FPyHcNsJnQcJQtiw1Htrn9o3v5nL8nw5eZFV8t46EQ
 SC71jlrbP/910iHtZVzQu7sUdcdxtpXnwVyCiTFR2KmztHqkNkuAPi6DOxHEp7gVsNEp
 bw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ATLAiO8uoee8c66oqfYdT1Zfnhx9V+nSe7jkQWl7mV0=;
 b=jpPzxGSjSLa6ZVxhNMRIv/dHOXIGkDBXHFW2TQ4dfsDYcagKv279Itp+Iif47BY5UJ
 8NV+XqXdTBEdVWPFxIuFMzlvldifCnt6c+f76Ad6Y+S6HkqrGAImO2do7K2g4NGPcm2n
 JUupUOiO4FahJu3wGQSEK/zbYvpl/W9afCJFPwcY84HYfdD6YmZ/IPcMS2QcesAoSjYA
 d0cb3Bsg9gTG19hJQfcKBVy+ASDaXksBtJOMXqtd7EWuJW9GznPbrgNs/PxAuZWyUoi7
 EdlfalPLCOsn5XAGozNE7RtMTiRLNdowHvTyyRbjnrwtAdlTMA4dljBNzOo6RKtOLt0x
 MiVA==
X-Gm-Message-State: AOAM532cfXdcqbHMUtsjumxY/6ygPYSFnR0sqWY3x3KcVYPaRY09RQv7
 tIyjX5MCQAYVYbtJ2EBpZoGQpA==
X-Google-Smtp-Source: ABdhPJyKDPiOTqf8IoPlxFpFGDCXpSmmBVkchVNsjE3zGsrjZiNCVwRV8iTsB+65cykt09cD4hnOFw==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr16199423wmb.3.1593441665122; 
 Mon, 29 Jun 2020 07:41:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm35907592wro.90.2020.06.29.07.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 07:41:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 248841FF7E;
 Mon, 29 Jun 2020 15:41:02 +0100 (BST)
References: <20200622143204.12921-1-alex.bennee@linaro.org>
 <20200622143204.12921-13-alex.bennee@linaro.org>
 <3ab77b68-9f5d-6b99-e226-df4abb186add@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 12/18] tests/vm: allow us to take advantage of MTTCG
In-reply-to: <3ab77b68-9f5d-6b99-e226-df4abb186add@linaro.org>
Date: Mon, 29 Jun 2020 15:41:02 +0100
Message-ID: <87bll2rl35.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: fam@euphon.net, berrange@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/22/20 7:31 AM, Alex Benn=C3=A9e wrote:
>>          if kvm_available(vmcls.arch):
>>              return multiprocessing.cpu_count() // 2
>> +        elif os.uname().machine =3D=3D "x86_64" and \
>> +             vmcls.arch in ["aarch64", "x86_64", "i386"]:
>> +            # MTTCG is available on these arches and we can allow more =
cores.
>> +            # But only up to a reasonable limit. User can always overri=
de
>> +            # these limits with --jobs.
>> +            return min(multiprocessing.cpu_count() // 2, 8)
>>          else:
>
> And if multiprocessing.cpu_count() =3D=3D 1?
> Seems like we should add max(count, 1) as well.

As it also affects KVM:

    def get_default_jobs():
        if multiprocessing.cpu_count > 1:
            if kvm_available(vmcls.arch):
                return multiprocessing.cpu_count() // 2
            elif os.uname().machine =3D=3D "x86_64" and \
                 vmcls.arch in ["aarch64", "x86_64", "i386"]:
                # MTTCG is available on these arches and we can allow more =
cores.
                # But only up to a reasonable limit. User can always overri=
de
                # these limits with --jobs.
                return min(multiprocessing.cpu_count() // 2, 8)
        else:
            return 1


>
>
> r~


--=20
Alex Benn=C3=A9e

