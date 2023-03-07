Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB426AD426
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 02:42:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMKF-0000Y2-PA; Mon, 06 Mar 2023 20:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1pZMKD-0000Xi-TL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 20:41:09 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1pZMKA-00010T-P2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 20:41:09 -0500
Received: by mail-lf1-x12c.google.com with SMTP id t11so15253793lfr.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 17:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678153264;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5u1INfFDElPf8bSzdh94F3s5MJGHsk4zt6U/aCCObNY=;
 b=pZYDQgJlYvxtdqp+6QQqWhkPWRsmEXw8p8J5kpUfBr+7inKNFXZ5i/6N41F4Sknn3k
 XW8G6nc1CavR+jdwg34RBcOeeqR4iIyZW4ddbDqRCbXdPrd40l0QTFTc6UOGvZK4VNTh
 kVcv+4+EcdeF9RBzF2VmuCvMZX9Dc04yMHCLAi2tt/BZ86yTvDI5M5oJtkhQ6mkBFgY6
 Z4fa7YIsmUKtp+SuhaKLB/qeokTJPCw3L+80n9L/yHR22v+e9jwptr15GXRNNqiQj+c6
 kGMq7ECBLolpdcB3mY7O+PCoKs5/v/ZQYdELskHjICBDqW8vjseMm8gk/YD+csZYoaAw
 nBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678153264;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5u1INfFDElPf8bSzdh94F3s5MJGHsk4zt6U/aCCObNY=;
 b=b63s2kgiandVOlLt7WvS+35EL2uzGlkO9TTDxBaYDfKC+aHHZ/bZY1hNu/A0ZImHdt
 ITeKJOrX9qzzAq9MpBtuLgjTkmHFA2/dX0ITURdYU+aaAnObwsOfYHU1HrpnP3WWOt41
 d8iuRDcJaKDWzRZunNxr4IcFK1220XFeqkA1Q662wBfsQo5wDk6xBeRPuvLurppvH0r+
 v9M2L2KHxE0cyzFnigcPe/rbZJhYMctIY6GON8xyAv4ndgrNHOAbM1l6OwgbF4hWEmT7
 cGXpJz/ShL2vdijMePjnY9kuaL4WlACR2r7aTRZtzz3J6m/MBUUNsRSJDZbfwcL/GR3z
 9MFw==
X-Gm-Message-State: AO0yUKVAth4F6tQYkyUIAOKl904A9tLuwRL8dHXwRQS348vr49MxqUcq
 mHa3P/WWqRL/UCnjAdJa54s4qG8yiiIM1LeLbvhPGDb6giFYccmwO+c5dA==
X-Google-Smtp-Source: AK7set+sTnX5nc7ONziYszTQc5U9VNNN9R66XezguvYca7T/xJFiBQZKdjUp2Gg93WcqVZNJj+6KEVAoNd361uBLBJE=
X-Received: by 2002:ac2:52a8:0:b0:4d5:ca32:7bba with SMTP id
 r8-20020ac252a8000000b004d5ca327bbamr3894157lfm.1.1678153263464; Mon, 06 Mar
 2023 17:41:03 -0800 (PST)
MIME-Version: 1.0
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Mon, 6 Mar 2023 17:40:52 -0800
Message-ID: <CAKbPEtZ5DiSb-avGpBX_+C6vk8dacBnEpTEtiPFV1WZ4Xk7Oqg@mail.gmail.com>
Subject: Adding Implementation Defined ARM cpu registers
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000026ae4b05f6458137"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=roqueh@google.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000026ae4b05f6458137
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm dealing with a problem in which I need to add support for some
neoverse-v2 registers defined as implementation defined in the TRM of the
core.

In file helper.c I can see the decision of whether or not a register is
implemented is based mainly in function calls arm_feature(env,
ARM_FEATURE_*) or cpu_isar_feature(<feature>, cpu).

The main feature I'm interested in is actually protected by a call
to cpu_isar_feature but the neoverse-v2 needs extra IMP_ registers for
extra configuration of the feature.

I cannot find any example of a set of registers that depend on a particular
cpu. What I'm currently doing is defining a function to know if it is that
particular core and add more registers for the feature:

    if (cpu_isar_feature(<feature>, cpu)) {
        define_arm_cp_regs(cpu, <feature>_reginfo);
        if (is_neoverse_v2_core(cpu)) {
            /* Add extra registers */
        }
    }

Where my helper function is defined as:

static bool is_neoverse_v2_core(ARMCPU *cpu)
{
    /* Looking for Neoverse-V2 Part Num 0b110101001111 */
    const uint64_t neoverse_v2_partnum = 0xd4f;
    uint64_t partnum = FIELD_EX64(cpu->midr, MIDR_EL1, PARTNUM);
    return (partnum == neoverse_v2_partnum);
}

Is this ok? Otherwise what is your recommendation?

Thanks

Roque

--00000000000026ae4b05f6458137
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m dealing with a problem i=
n which I need to add support=C2=A0for some neoverse-v2 registers defined a=
s implementation defined in the TRM of the core.</div><div><br></div><div>I=
n file helper.c I can see the decision of whether or not a register is impl=
emented is based mainly in function calls arm_feature(env, ARM_FEATURE_*) o=
r=C2=A0cpu_isar_feature(&lt;feature&gt;, cpu).</div><div><br></div><div>The=
 main feature I&#39;m interested in is actually protected by a call to=C2=
=A0cpu_isar_feature but the neoverse-v2 needs extra IMP_ registers for extr=
a configuration of the feature.</div><div><br></div><div>I cannot find any =
example of a set of registers that depend on a particular cpu. What I&#39;m=
 currently doing is defining a function to know if it is that particular co=
re and add more registers for the feature:</div><div><br></div><div>=C2=A0 =
=C2=A0 if (cpu_isar_feature(&lt;feature&gt;, cpu)) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 define_arm_cp_regs(cpu, &lt;feature&gt;_reginfo);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (is_neoverse_v2_core(cpu)) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Add extra registers */<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 }<br></div><div><br></div><div>Where my helper funct=
ion is defined as:</div><div><br></div><div>static bool is_neoverse_v2_core=
(ARMCPU *cpu)<br>{<br>=C2=A0 =C2=A0 /* Looking for Neoverse-V2 Part Num 0b1=
10101001111 */<br>=C2=A0 =C2=A0 const uint64_t neoverse_v2_partnum =3D 0xd4=
f;<br>=C2=A0 =C2=A0 uint64_t partnum =3D FIELD_EX64(cpu-&gt;midr, MIDR_EL1,=
 PARTNUM);<br>=C2=A0 =C2=A0 return (partnum =3D=3D neoverse_v2_partnum);<br=
>}<br></div><div><br></div><div>Is this ok? Otherwise what is your recommen=
dation?</div><div><br></div><div>Thanks</div><div><br></div><div>Roque</div=
><div><br></div></div>

--00000000000026ae4b05f6458137--

