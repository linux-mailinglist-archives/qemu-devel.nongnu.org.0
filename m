Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078536097F0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:46:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjlq-0007tq-MX
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLuN-0008Gr-4O; Sat, 22 Oct 2022 17:19:55 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLuL-0001qf-IB; Sat, 22 Oct 2022 17:19:54 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlwFp-1pVLUS4Bdb-00iyb7; Sat, 22 Oct 2022 23:19:44 +0200
Message-ID: <203ceff3-5251-c03e-8d43-802eab45de64@vivier.eu>
Date: Sat, 22 Oct 2022 23:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] vmstate-static-checker:remove this redundant return
Content-Language: fr
To: dinglimin <dinglimin@cmss.chinamobile.com>, thuth@redhat.com
Cc: alex.bennee@linaro.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YoxcKFFygAIimmOLiNZcaNwwj5PBQjEoHGgsyXxHPYsXmhQys9b
 accYB8T9SsDt35VU63qH2X8AAhTNHo8VgwEkKUmPkYarCdck/1Np4Y0yVJdfgRg5Cx8f+XT
 8SX5Qf9kkfx3QkgzjjD5KlcWoOszTC4UufkC6gGlW2kSnV3H/6fbX2dLppPBUcfdR5fke67
 Ev4OcFZ+3F+bqeLOvsecQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ruHY1dDL3XY=:d8lbMj+XdvI/0zk5Krew4o
 6fa0KzwfrbThZiebWOBSFLEfQYvw/ZCOWRCUEIX4haEDunKbJqObTEP8JqE/3y88hVN66xPtv
 O88Q9Nw4Q2O81gz+eftNNlicj/S1bXSexiFLLttmJbCVix66rOkBz/zR1W2NibuUpSvszV1uh
 KH3/x7EXCla0nLMTNsrvlG/meB+AXbVbPfpNxTzHtdNofoOfCMo/+Y09xZqXuDpIrHFO4uLjc
 lXRZDLN2TlkhPDGAX6bmJeNvObCvP9Aei831TObUWTT8gwXX3mStM2QznFc9z9wHYsVkgEEyP
 v3Nq36boWo7GfSb7ZsO/VivZ7TRSKPev3H5s3RHEVpKKZfy67cN0o190hl6rpvUqe3rijxNuj
 nQ+oXiLqcZJWRU5IP70qRuTvj/KLT0zaHrFNciC0NryhkxiLPvNHsc480EVSPVk15t1kw3Vvg
 QwR8FDDUkwEKoJ9PB6W8Pe/GGGl5Bo/q1MP5jIw6C9PrMtRXL6dcnxziS1vc2YfdaoL7VSEMK
 NDvNHvrsEhb4rdC9BzT53oQ9vlu2cIh8xEgPK2+IPVfxIfWtYQSoN7tXaET9dTeaFQ3sDUiw6
 oU8Jy4v3FrOuIyYLavESSYJGkrpmU2qO4bw98QZPhW8jvTupExFQIpb/qbo1qFw3U1KHh6nYy
 VrxVDzpHS5GONKWW5rhyLoZKrhvityWNqjaYpngbEacUxz/NGcuypTLozQfNPgarEz2/g6RmB
 STYhGxmn/AfPGw6euVp77WfrfgKviyIOICRd9CvncmdXUMFM62hf080NtYbCUB3zSKAez8btM
 f/402HH
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/09/2022 à 11:03, dinglimin a écrit :
> Jump statements, such as return and continue let you
> change the default flow of program execution,
> but jump statements that direct the control flow to
> the original direction are just a waste of keystrokes.
> 
> Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
> ---
>   scripts/vmstate-static-checker.py | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
> index b369388360..dfeee8231a 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -367,7 +367,6 @@ def check_machine_type(s, d):
>       if s["Name"] != d["Name"]:
>           print("Warning: checking incompatible machine types:", end=' ')
>           print("\"" + s["Name"] + "\", \"" + d["Name"] + "\"")
> -    return
>   
>   
>   def main():

Applied to my trivial-patches branch.

Thanks,
Laurent


