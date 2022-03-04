Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7164CD267
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:30:03 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5CE-0006nT-6f
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ59j-0004WG-Gm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:27:27 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:56661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ59g-0007zU-CX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:27:25 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4z2Y-1o8wVu197M-010rUJ; Fri, 04 Mar 2022 11:27:18 +0100
Message-ID: <8c1e698d-70e9-2c26-e991-e761a9ed73dd@vivier.eu>
Date: Fri, 4 Mar 2022 11:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/10] macfb: add VMStateDescription fields for display
 type and VBL timer
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:We/NzyyCdn6HoGBy7o+nn+ciCE6b0JVG5pMPcHH9VsrDSRjS96w
 fkyf/WvCP1N93N9jczJJswPNeO4AyvFFfFQfX8Vj5N281vxyrsVcFJB+6mvHi2q86NDRw1y
 MxK22QQe225axtsKsDGIq40ulcHsqqOlLNIxzw46Hp36NcmXk33Koe/amhB5qYLuz5t+yyP
 sLRzyqifO440O5UokIXcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+EpAqBdg0qg=:LSrgLkzL4Vwf7ujUKmvtE6
 vSXA1O4zTtfO76VxCA7PiD94tM3rC6yc+THVCt/RB9l6tNag8N4IkIUvfTP5k34wvYSnCnRoX
 DMJkTxrkmeeh1LVXkq5Pb6Izj3I+mfA+UwXmV/87sj2rlkrv6nGdmDHU+spwFclXt8fUiD+rr
 mx++Potrrq+6oBkbbv0m/QKGTVyWaSEzAUm8H8th5FM5p0slRveNe+yH6gtQHUKtH/a6fM2cL
 VpLZicGvzoYw9Oi69QjaFeWL6wqEJfErSRH6JIl6ykdgMDOMXSJb/DeHMhaNe67Kd/4Wdvpe/
 4X3ro+cicDS2BAeqxQsuQaSeAJF+dPiNyjyv4uwvCCkmULk7gPm/BNH6XOdrhC4ntRKQykBks
 4+JaJgNrMvUo9C5TTVVz+kqj6hz6Cb5LJwhs1wdBg6WDBRJJLY+UszJ+3+ehIGc4tdRRpqa/M
 EGUSquLBFuzcolKv8ANUloWC8tK0bMzGirhce7U7Rz23ITsziAMOB+eNa2zRk99Yi+6hs5m6d
 ZtfM8aZxZB7JEVDAoh37a2sh0RUmL9VMOKw3lR/BKDFqCvtPZ79gr0xKJB4r2UVL0X1E2gUgl
 sCxGYlYxmUQ/bdN4Zch+uwRVITIxM6vzqKI66w7+F+ocgmbbDtucj16VXsOR0e1s8GEEIvht6
 3kAHHpLUhkHnAnCRmEdS7ZH6UbvghJB0Ju2oi/pJMUcp5RMD4lvLCrCuLuT9G1S/w/dg=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> These fields are required in the migration stream to restore macfb state
> correctly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

