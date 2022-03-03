Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B554CC6AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:59:27 +0100 (CET)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrbi-0007rA-3d
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrWx-0007II-7u
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:54:31 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:56227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrWv-0003np-Mb
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:54:30 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBDrM-1nKw6n39wM-00Cjbr; Thu, 03 Mar 2022 20:54:27 +0100
Message-ID: <47b24a1b-2b31-07fd-f768-38d740edcc8b@vivier.eu>
Date: Thu, 3 Mar 2022 20:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/12] mos6522: add register names to register
 read/write trace events
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Hblb8+d5ucYbPFBAtAv/AqceScSqc/5o01EHUcDExFBmd8W3YR
 kt8LFveD6Qr2i2110gdoMYnZUA68bFqTCEW7ig9kn1NnYD0Ql8iC2Z7TCGU5FghNNRHZeB0
 apFWNCZGkeRfUtWwLqjneJgf7pNC1kVrpV14COo5U4/m/+NFJi/w+Zw5ybCTNDYblVrlWE+
 Ziq8483P/FhkvmtCs8xwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8PhKzw8pAvg=:F5Q+/iJMfPTks8Jpj94iER
 XbC+GCZAmMlWM0q+pwiJmmDbPM5mHO50aJ2b82U9ZShLAFIvfuNl02oosaO7sPVApRPPfLNlb
 6H+lbD/VPC3dTH8E3dfOK1GglQM3oiuIOzx8gImVgKbioyb7mnP2dCkmfEjvgSQ467yjvSYfG
 tMxuHBpcJonQA9h9KshZ/biYYnAdJvy1huv78xe8nOTFZRt2lLW34wt4QrhXmYNbrHWx9IlZB
 ju1yOmx8D4M24rJ8Hn75ClU2mlDe5w5UFKRlxqn0Od1o3DkeIo0UKz+TVllSRPLDr/CrFakyZ
 M4eZO86G+VfnwyquYOJzraxs3YvF2tQUkN6nKH/LZk73e06wjkvOBFkleFOlgJJDvMLCAhRco
 XfaC7V5tIHK9vfCeKRY55xL+KKwjVFZCIv4Pjrgwq2QEriIUFWZpYVdREZYfqA7OXTbTHWoBU
 LwdcKEwhKaMKKO2B1bJ85YPehWuyl8PZS77b2AkoIcA+gqZ1HLFwF+AN8M/isBfnAJlxZg7pL
 qLiJJw51RY/rEg5Rd1Wa6LsCAPOz1qctbCvxiOIxrlmbVeqBFEIgRpv9I88DHMhoF4flCbZRS
 2fEdIDr9+4sFJACIUPhySeoy4fBmYj6G3ywJqTNJTUJnvZXcohULwM2x1fo/I/TiSqs7r6u3i
 ImNLhgPP5UhQcKcFd4KwZyQbTE58BXaFREuVTiZlqKW1aWrcSXL611mJGAl0bo8T3OEM=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> This helps to follow how the guest is programming the mos6522 when debugging.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mos6522.c    | 10 ++++++++--
>   hw/misc/trace-events |  4 ++--
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 

With changes proposed by Philippe:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



