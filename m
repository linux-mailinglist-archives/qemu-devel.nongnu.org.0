Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296448C7BD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:58:41 +0100 (CET)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7g1I-000867-Ht
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaro.koskinen@iki.fi>)
 id 1n7fQg-0001vS-V5
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:20:50 -0500
Received: from fgw22-4.mail.saunalahti.fi ([62.142.5.109]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaro.koskinen@iki.fi>)
 id 1n7fQe-0000ur-O5
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:20:50 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-86-66-nat.elisa-mobile.fi
 [85.76.86.66]) by fgw22.mail.saunalahti.fi (Halon) with ESMTP
 id 34e6a3c7-73bb-11ec-ae1c-005056bdf889;
 Wed, 12 Jan 2022 17:20:43 +0200 (EET)
Date: Wed, 12 Jan 2022 17:20:42 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: "Darrin M. Gorski" <darrin@gorski.net>
Subject: Re: [PATCH v1 1/1] chardev: enable guest socket status/crontrol via
 DTR and DCD
Message-ID: <20220112152042.GD1827489@darkstar.musicnaut.iki.fi>
References: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACdcevLHrP_HZED=SHMUzpF5vfFawJ3gYOKdeH1X1PHRFpWLgg@mail.gmail.com>
Received-SPF: neutral client-ip=62.142.5.109;
 envelope-from=aaro.koskinen@iki.fi; helo=fgw22-4.mail.saunalahti.fi
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Dec 16, 2020 at 05:06:51PM -0500, Darrin M. Gorski wrote:
> This patch adds a 'modemctl' option to "-chardev socket" to enable control
> of the socket via the guest serial port.
> The default state of the option is disabled.
> 
> 1. disconnect a connected socket when DTR transitions to low, also reject
> new connections while DTR is low.
> 2. provide socket connection status through the carrier detect line (CD or
> DCD) on the guest serial port
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1213196
> 
> Signed-off-by: Darrin M. Gorski <darrin@gorski.net>

Is there any plans to continue working with this patch? Having the DCD
status would be very useful.

A.

