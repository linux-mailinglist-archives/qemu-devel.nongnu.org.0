Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C583C333054
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:55:10 +0100 (CET)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjNl-0000j8-MP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj0C-0005yV-Hw; Tue, 09 Mar 2021 15:30:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj08-00024C-SG; Tue, 09 Mar 2021 15:30:48 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOzKk-1l7XEn1kmC-00PJcW; Tue, 09 Mar 2021 21:30:37 +0100
Subject: Re: [PATCH] exec/memory: Use struct Object typedef
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210225182003.3629342-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c347c47a-6054-e2f1-c50d-ea23b325654a@vivier.eu>
Date: Tue, 9 Mar 2021 21:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210225182003.3629342-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e7LQ1VgVBqp3FWWZwmtQ2nSyVigxhh3nOsHw5K5OW75oj4hI28L
 SkdgQN1nH81KiogPsgMsMLjh4TVOQyhaHAyyvVBDQzxN+yDq81ovrTKqZccvSdncpFYqfSq
 /TxFTYViwog3V5O22HkXgvrbTOWUb+vy1Ag6WYH0Cg3p/oEv9EBnqeQoTy8YjLAMh0Mz1A5
 W1HUtvxGMNC0YTIgHTZBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4aR1tr4MJeE=:LcwUcQpxPefy9beX+l7Gi7
 p8SC3daL554jk887mBiUpt5hsAk5XpQCya+/iMRNdpLu9drSkOzSt9Vtnw7vsmAS5ux3nSW7v
 JY0JmgKs/ZEtRyqWHb2fkTEqsU0LvTs5o2hm9QXGEkLSO0+6V5MVeMcZQE2nUxxWa/qsdZOwk
 kbY1vyznNDLDG9XC9wuTVR4mYEpDaFaJfVok9eLvSibBStkMU7xX99ii6phXcUX4UB1pZpxff
 brvmnzvFqARieseOHo7OcXxYO8dLKip8Bbq8mMy4jlin1Wrng8Szzj624b7kk5MZIJQnYpRb9
 107LrY7BGegdBID5aFJb+wXC9ay2svSUzHANPzJY6tD65wkNAqDRZX514ut5Kfxc8w+UXjK31
 VAnN65WzWh0lhuQXqaO5RdWEZHIMUTs+YNmLVVqGQlm/8F23BH2gmFiNuS67A
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/02/2021 à 19:20, Philippe Mathieu-Daudé a écrit :
> We forward-declare Object typedef in "qemu/typedefs.h" since commit
> ca27b5eb7cd ("qom/object: Move Object typedef to 'qemu/typedefs.h'").
> Use it everywhere to make the code simpler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/exec/memory.h      | 32 ++++++++++++++++----------------
>  include/hw/ppc/pnv_xscom.h |  2 +-
>  hw/ppc/pnv_xscom.c         |  2 +-
>  softmmu/memory.c           | 12 ++++++------
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>


