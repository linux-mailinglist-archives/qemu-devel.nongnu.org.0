Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B704033451C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:28:47 +0100 (CET)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2da-0003Xw-KO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK2V0-000378-Vl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:19:55 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK2Uz-0004Kc-7t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:19:54 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 5E2691E7;
 Wed, 10 Mar 2021 18:19:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVkomZAIcRd2; Wed, 10 Mar 2021 18:19:49 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6B2FD165;
 Wed, 10 Mar 2021 18:19:49 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lK2Us-00ErS2-P8; Wed, 10 Mar 2021 18:19:46 +0100
Date: Wed, 10 Mar 2021 18:19:46 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
Message-ID: <20210310171946.5erveyry32lk2vz5@begin>
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
 <CAFEAcA-mgsMd4roQc_7QYkMMMqXeFyXiQGtCGp1Bju1P2MCi5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mgsMd4roQc_7QYkMMMqXeFyXiQGtCGp1Bju1P2MCi5w@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 5E2691E7
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell, le mer. 10 mars 2021 17:18:11 +0000, a ecrit:
> On Wed, 10 Mar 2021 at 16:08, Samuel Thibault
> <samuel.thibault@ens-lyon.org> wrote:
> >
> > When Braille output is not available, the backend properly reports being
> > unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
> > imply timer_del()") made the timer_free() call now refuse any NULL
> > parameter. char_braille_finalize thus now has to be more careful with
> > calling it on baum->cellCount_timer.
> 
> It wasn't the intention of that commit to make freeing a NULL
> timer invalid;

Ok!

Samuel

