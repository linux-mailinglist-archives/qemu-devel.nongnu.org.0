Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFAB3A6BAE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:27:01 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspQR-0004Tf-M2
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lspPS-0003Ve-1L; Mon, 14 Jun 2021 12:25:58 -0400
Received: from mout.gmx.net ([212.227.17.22]:57323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lspPP-0003eW-5U; Mon, 14 Jun 2021 12:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623687928;
 bh=pnpZ/N/uKQjR58yLt+ZZk9Wc3NIFk9iCLB4Mj4JEs2c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=THFDojAlJKUkUvIVq9Qxz5SWM5C+OVJmAe5M543SD83p15wiI+fEwZ6SrnfTYLgAn
 GaiPcUjU6lqox8eJrIdZ3uBPDpgwNnqtUwhlHS0OCMl0aa+IQLi0253qAuTuVsksmO
 9X1mF30aFNIYklqllIR78ZCKnlk5/pAjLV7aeoMA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGRK-1lZeMI1BH4-00JL2E; Mon, 14
 Jun 2021 18:25:28 +0200
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
 <87im2kzwj8.fsf@redhat.com>
 <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <c6e20262-9602-6bab-9458-9a9b11633b2b@gmx.de>
Date: Mon, 14 Jun 2021 18:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ORFM67LTCWED4LDuGAEgh7PYr0S6ahqSPYmLVQo6YsFGJ3KylgD
 E/TVQDJrF+XIWn2rHrs7v+QBr6cvczKO1GIlPuJbkO2IiNl4D2LIyJ2dLbLyJm+DSCbokMk
 +df+UY6nwB2zahVZSZd0y5u8/TWTAdwqxrFrJw/IcJhpG0AMtUIH2At4TDvCsd1YTON9oG5
 iBHtGuB2w0Mv/cVcXOKMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mPnlS7FxPUM=:LzvI8dEvJMYDckG0quqmdU
 gmy09II6Qs1Y3qAhH+aMiHGAnTkLYJWU7wLzQxYx+1ziPQbMQGUaFgdQy83Hu+IPKNEu/phzR
 E7LSVAfNmjRE1fLsWLu2zC5hbwo+aHdpn2cA/3AOfYAdTxTNT996rrVm1fRbqK0yWHB2jwyY6
 s3MlwHU5chhM5DrW3tuMqPz0ko8Yhsj4XIv0AX7VDA3BDSM2m9ILXttr7Q9QkKYLLlCGsM62+
 mt/Gjb8pLu/5B/HnJzoHLshOwqph0Suh9BAIlP41d61vyCrHhjuOQYYg3thYZVdR3SraFSGh1
 RckQvUILQul6w+1OUllOphrGIPGvXCXQuPt6rSM1j9g5LSYO12D5yUvbdwNZPDDGzXTvn2S0+
 77C7k1ORjyYiktvjL0gxxd4NHB+6a9A1n8ZGGQMg84xQj2IETkHV5n0jFz2q+7ZsftyV6qr5M
 Y48Fh2ODAjrjYXebNvPbt009sA5U2sLdp3yS+XN3gkMjeZBp4dhRm7xUALS/H7d511J1MkUJW
 nYJKAsFDQnm+AuSneXe2BkWq/VPLCiTV1+5PXkaxSCTP03JwKuwHmkBKRR6w78XOQj4Vx2k+O
 0YQDqfDzO5yio4lKH/wDqwVm6dK4nYOzzHVDAZctRAtuLaSN/LA+sljY5pQQxRHos+XarCHmQ
 gWbysjfnpeaOuEsKFaAWuNN6Is7dGjmNbvXQ7+D2AgWkqW/95TexN19i8j3H6aGI3d0qbuFsy
 MqNsTfS6CbkN9N5epxWNosT/Vw9AKI6kWJz8tqAuE3pvJtEMIjLEODIYNkehWbJq6o0eA1dSq
 WPs0hGNuwZxtfvUqGrjaFZxZQrgbedI5PY6SBkQE1prL8Be36fQV17DUTDawANbV0FffyllKr
 TGG4sjPwN4ifncqC16O4hhQp1OcchoGMtKsDGozo/QuAWld3dFR9A04cANYKJDIRLBvDIssDA
 Wgi5doQY0d0ZTv3Bpnvj56N8s0A4KqqJRjWmSA9dbEEX9TSeRKdDAYj1q8hMt8tGugYLVBOz7
 wXaGcU5RiRmrHJwLdWSdsDQlNMdw4J4RBtF3a9vmrRhyL+h1ofCySggJ8h3Cw2ZpKnM2TWfRL
 ueLi7q2gzNXA5nNZ3BM2QMwFHWkO39qgr7v
Received-SPF: pass client-ip=212.227.17.22; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 5:35 PM, Peter Maydell wrote:
> On Fri, 11 Jun 2021 at 08:32, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Thu, Jun 10 2021, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>
>>> virt-6.0 must consider hw_compat_6_0.
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> ---
>>>   hw/arm/virt.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Oops, forgot that hunk.
>>
>> Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
>>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>
>
>
> Applied to target-arm.next, thanks.

Thanks for accepting the patch.

File MAINTAINERS does not indicate for section "Virt" where the relevant
git repository is located.

I assume that you relate to
https://git.linaro.org/people/pmaydell/qemu-arm.git
But I can't find the patch there. Do you still have to push?

Please, add 'T:' entries in MAINTAINERS for the sub-systems that you
maintain.

Best regards

Heinrich

>
> -- PMM
>


