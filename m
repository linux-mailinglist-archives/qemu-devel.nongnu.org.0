Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0F32E262
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:41:41 +0100 (CET)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI49c-0007MC-81
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1lI47q-0006Rx-4Y
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:39:50 -0500
Received: from sonic308-21.consmr.mail.sg3.yahoo.com ([106.10.241.211]:41317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1lI47n-0004OW-Sr
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1614926379; bh=Rkgrue2RyBRqAFbGMkDjaM5T/juP8/8QXOEDpiKHO3I=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=jcv5galp7oVy9oWNYnDVFf4ipFr/6XAs3AkU8O9XaRJ8g4VW//UsnGta7jyBUxQTF6wf//RmS4XsYeH5gCbyfP/6hYcLkPKovaW3QPi8pmOlnrqFjtSrVc0+OzviwAK2cgjdn+4vG2leuIvgbPTKirEFMYA8Ax6D42QeJVX+y1Aa5WCxq7+4MWkteSdnbIBFoRlcMIdCwtlXtU3k7Xujrb+yJaOJFDFAM/cPRVR9d1vJDLNtZWSx6LAcTK6bVNtfJtqzfvNI+9a2ydz9SEeAj+NWYGeewrW0bp3J2/nDc+UAeWLRw1R1TqpUcb7GuiWKEeTdx3lhnlM0urYvko7Hdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1614926379; bh=shXrBrqS+/HFtncBPFU6lznKIx7ANocZ28uN8pcdM/1=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=AcEiye01GtIbk8ErrPfcqhhe3XSI78O4JGA7H6rIg0I68WsOjGSAQJ5rkThIIe9rN/Iy3/8x5Ip+jMN82cKiY0raLuOm8qYvGXwVPkn8oCWyXxcf/9gWMQMaH85Yxd6avh9Bo46f31xqEeap7HvykhKeMkszqgOwrGV2vnuL2I38rRU+gj5tHjy748Hv6oLUkDTSAvqmR41D8QVXMfS6n5WrG38M6OnCTJ0qt6amB9gIgDvqgdsp/As/P3gmE97yY01X89zLkmMHGC2XdqOMPwkNe7S1rJ6d8DEF3PoRXh+qc0ek4wmadI++sqBjugEtEyl22lU1amlLnngtZJWJbA==
X-YMail-OSG: bjpEHAMVM1lZLMfrTELp_cIo6XOMcbvCm1ugMFnFAieMlDmZgDR9i6n2NZKtSSu
 arcq3mI1GLZ_lJF3MeouDs9jpsVmFsLwy2Fyu184Z9BnS5cwSY5ujvCKK.rv6pT6o9SBSxHV3VJR
 3YiZ_iokPGkCgRXIpIAtdI6gYQ6j9oTrO_DyKx6AkzSariMTn3MiJhlUhQRcyyNOAMUbasA4e6Tf
 oa7CYFqxa5zpkTnAj6r4k1HEnCmwjG9JETVJbym0Svq6gVuKMd.qChQPH7BmnXjDqcwWBtBgMQAL
 XHanJU.PrcNaHH1M1hWmL9XRrMPfXDMiI6T13yslrfRHxQ9axLMwhAjsNSPOkHfBdauy_n0ZhGMt
 B1On8KLthSe7rLMXje1EXGnWaATSXKg7LWlBzLUk7vqonZGlMwi5Bn.uSQUhTvGLnRtQuVjq85wH
 dH5MSi3nwVIN.H9QVBoEqdzXKcv6DTVZEkQ5LPVwktD7vfWO6LtAEJuaebjuVFZ5epfk9go56wTi
 fEdwyblwLQbm0u027tNeEWZtabgTvc33j.3_KG7ISVEr2QafaKwI9pTblFVBdC1QAPUv9ItypjmE
 YQGfvZwdHlon1h6nwiCQ8Auc0qkUYLsDm.OyqI2mBdbDyG9HCKv00h0nLqbhkJLTOSdUOdWqstT7
 qz6FeR_vdP3uu_vO1mfegcf_4MJVDukWOcQs.Nuoi0SrD7S6rAdCZKZA105IsF4BMEYxFXvBojY4
 82YXxKgHBU7K59m.X8i8XsbOIeBKEb2FSGVXUY0qwxKwjno0p2SborC_7XYDPxjZo.2.hkcyf4NK
 JvHtOWIcY6ZWxxWdiH8i_6CL.aGlyBrEY.0i_g5SS.7KfJMHbsPEN_ei.IptsOYrjvNR5dczK4J7
 SO5UYDgYMrafAEFdo76MebKmQ.SKYifSAesxMX8bvCRX7DSi.Q3DqR8vlDVnQqFjZelg.2ehNaRK
 jClvQDb4dwPMh2cQg2B_DqRN.SIhQc9yaMLcgYUGpYjeR1gWWVOVv4CBZt.m1OE1Xe8VQBStk0aZ
 FldOP.iobwOjzLGNpeViEBX7Cx6Y6KHPf5QcS4lXX4CJKzCwOHRR40WvxGqR5tOh7oA5pAfbFrHB
 20dI1y3BduOG8W5yPrZT_2sbZqV.SHBI6QirCpOUJLwDWE9MdVKFIfhsROT941J46q11kVa0ja6Z
 7sNKAWKjOxBsCqC_F0yBc7dkOLhwTyDICvEVsZuQdGRaeqvdmyH28oqvgtSBvYDm8DqK3JLUT3r9
 QDtJLYURhjodLS0boX.I9rVINB0vzTSaxwLbeRbLht9HFCagHLlhujwCr0z1QT_KOdWIFQjOO7VI
 JgQdsj9qsCaYC7gItD1eDtF_ytxeFq1RGKwQBpyQZBapg_dOK3qoP9zme5V_quWhlwqPOjUJOxv3
 .vGupWCSy1Kwt6ifg65Wdg49kB0RWHbR.YqxHthdTIpvSnV8nurb1AomjTmoK1yhHAaxHgpqRWkG
 se5sqs3d547bmCUTWJE1jQkxs86QanYhvc9MVl3pdoGc_QOeFmB31VPqNtDlth90g.Rxlb9ZvmW2
 S5nGZZVf.kJ_dAc7SL07f0uOTvdKIlUQOvYvSfuD94.F36KlHpcL9dXvfGKj68km3YeCWTRcSFtb
 2YtLt6DtjG6QZMfY4.yKb0kRit.tBkIKop_HJrEahKRBG1gOkhf4dylPTZm0AFxzQLJ3z9A1YzXM
 2i_lyGR6siKHVY32kDRQamQTXYYYgkPeizt05C0ymkiNVgQ1Suj5IsD.Qj3_hVPty2Llsxrcgd_E
 hfp8p1oH4jFa6vlca3xu7NuQin4dCwxm2moMWcCxlYXJXWOugi9WkD0LRaPlSmQNSH7RFUV81Abk
 cajYezz88mPBDgflX0TiQrkDtXTsTj89DjonSmIlT1MUqmmMlNpOfVVyluOrKCrdIbrYkgP7JYRK
 CJg_AP8HV7LN2ig6S3MwWuskPX76k_.kCl4I_JZ5OZIBLChAMlULoy2rJJGkj2H9GWyBapPGmV4U
 ohEHCRKEHcuL9na5SvTy7rojeA.fZ0Gm_KwkIG9oaYi3UcuRiAXRLM89W2dHhDqf4T_2hz1wg_z8
 omIc24TfPvdqtYdhdwnq9iiVt6KMmM_t7IjfI6oMHUBbQ96MximnlwVTePmZ3IqA8tDAunZ4160B
 iyfR2ubLhqzlV3Vs6Mftg69uz7pI0cmHxVcOvx2p88IyXOkclrLmJS7rwYScHD1sEegDqO0qq9be
 oXVfCxlJClbFu0aNRq1YU6_oME_FLG_KAmrjFbnJFdQuGgDh4oAJyocf4blnlTZR0ZDGmJTap6S9
 EXdYDJ.93p_OIRVv.xObFFDMgwjQzaDDafbH6Arma.VZAEWD_XcCjIARAn_awH3fohtCpL.b7cbJ
 10oJJ6PE8M6jpj1Yraj_G7NDvHfSaqY21.CjvszzvVIAbjLiPGlB27.AcMXoTL0Ab9nMk1MxNFac
 iIoXgYvXU7MfFpuh_ir77gpVD3pQKPBUxSSLK4KHb2hO6voo.jHXXiqF9GvIYNqxvvw_cKKjZtm4
 W_dUryIFaMfWP8krZQnnXcrV5QiZV7r8VnJU8OUmRoQq_x6hMUTDbJHPQuLgNBdEiTF.PMWPdHHB
 ihvcvPndU15NLhnP.hriocOldJZk.N1GycjgkArxNP36rtBsOr3mO9BpkqidMpVt7teuuBXWoKPO
 cY6IQL48vKhKgcnVpZiziSEmNmVNx4winBWswONXe3Wfvfcd7Avbb1v6KqbaS7_eyl59uvwMcr0v
 1gpxhcH44gO1GK9BfrYr9yLkdeZmWbFhN7M6samI.lRVq.oPJO2d2lN_S6f1OdRqn3AvATVrz_89
 dcQ--
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.sg3.yahoo.com with HTTP; Fri, 5 Mar 2021 06:39:39 +0000
Date: Fri, 5 Mar 2021 06:39:01 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>, 
 Jason Wang <jasowang@redhat.com>
Message-ID: <1596609759.756731.1614926341290@mail.yahoo.com>
In-Reply-To: <20210305062638.6749-1-jasowang@redhat.com>
References: <20210305062638.6749-1-jasowang@redhat.com>
Subject: Re: [QEMU-SECURITY] [PATCH V4 00/10] Detect reentrant RX casued by
 loopback
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.17712 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/87.0.4280.141 Safari/537.36
Received-SPF: neutral client-ip=106.10.241.211;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic308-21.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Reply-To: P J P <pj.pandit@yahoo.co.in>
Cc: "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "ppandit@redhat.com" <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

Just to note:

* Let's use <qemu-security> list to review non-public/embargoed patch(es) o=
nly.

* If patch(es) is being reviewed publicly on <qemu-devel> list,
=C2=A0 CC'ing <qemu-security> list does not help much.


Thank you.
---
=C2=A0 -P J P
http://feedmug.com

