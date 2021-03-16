Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416BE33DF4B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:44:52 +0100 (CET)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGYd-0002Q7-1Z
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMGWO-00019L-Dd
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:42:32 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMGWK-0004nB-Sb
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:42:31 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCsLo-1lV6Cw3AXI-008o8Y; Tue, 16 Mar 2021 21:42:26 +0100
Subject: Re: [PATCH v2 0/7] mac_via: fixes and improvements
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7a650423-004d-3836-c832-89025a2e9538@vivier.eu>
Date: Tue, 16 Mar 2021 21:42:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:alsCTkTxZelYSAXfGx1pNWMUrUfTKbTysh5UifH+UffBrR+gZ/H
 PBPApSuDM8VFTgQv8lB0KWkOy+0EBo4g+Q6nvYquaTWQ63PifJ9T+AvjN4LjIIu8qzWmvo8
 MJ0UY1s/nQAIgKybSXoqH+tc2U3FqNpaCaL+6D9z9SbvlyQwcYw9UNkxKOuqUxsOwomrwcb
 Y3ad+PFOzTX8t+/KTXU/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m2hoG2HGM6U=:iX8bzquKAKhIl4iYFRhQKF
 VwwZMRcMz22BhmJg+yJq0H5YGqUtjlla/3sJV5dlysntnaeJl0bjxy6PSlZyfreN25u0/vkgG
 Om34n/o85oNW/tnD3uqSIDCetUUMfnRxEF4HW7uvxvGs0AEmwBK1HSN7cteusRl9Snt2m5KuF
 ipyIfYrJqstH5PEKw08JZ2vKJiLGsFJWkxAVWB/OFdsk5CMSu9gU24OVL6YKkQAxJmM1Q+B9F
 F88NpA1d4jYtPoVMJCemsXt7YpCbcVT8kHQ11n9xMMrJUklHgZodkV3AKEsGm4ad8lyTS2xJM
 5nttvn/95rUyQdGC0ArAfEUnnRkCjq8/YRGiddapS/wZ24rM/sqx3l3pBobRKqQ8zYkFgWq1C
 SuIrw9JgfZgSjkdNoebJZu0g1Yhy/QEyOmEHoDc6fbDHnuIeeOufxrygm9Ukqjr0xBnhv+kbv
 q/ShDna6XA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/03/2021 à 11:04, Mark Cave-Ayland a écrit :
> This patchset consists of a number of mac_via fixes and improvements taken
> from my attempts to boot MacOS on the q800 machine.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v2:
> - Rebase on master
> - Add R-B tags from Laurent
> - Add VIA_60HZ_TIMER_PERIOD_NS define in patch 6 along with a comment referencing
>   GTTMFH as suggested by Zoltan and Laurent
> 
> 
> Mark Cave-Ayland (7):
>   mac_via: switch rtc pram trace-events to use hex rather than decimal
>     for addresses
>   mac_via: fix up adb_via_receive() trace events
>   mac_via: allow long accesses to VIA registers
>   mac_via: don't re-inject ADB response when switching to IDLE state
>   mac_via: rename VBL timer to 60Hz timer
>   mac_via: fix 60Hz VIA1 timer interval
>   mac_via: remove VIA1 timer optimisations
> 
>  hw/misc/mac_via.c         | 194 +++++++++++++++-----------------------
>  hw/misc/trace-events      |   4 +-
>  include/hw/misc/mac_via.h |   8 +-
>  3 files changed, 81 insertions(+), 125 deletions(-)
> 

Applied to my q800 branch for 6.0

Thanks,
Laurent

