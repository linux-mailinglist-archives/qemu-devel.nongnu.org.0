Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D282BECDC1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Nov 2019 09:34:41 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQoro-0000go-FH
	for lists+qemu-devel@lfdr.de; Sat, 02 Nov 2019 04:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53947)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1iQoqK-0000EF-5s
 for qemu-devel@nongnu.org; Sat, 02 Nov 2019 04:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1iQoqI-00016g-6M
 for qemu-devel@nongnu.org; Sat, 02 Nov 2019 04:33:08 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:42140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1iQoqI-0000rP-04
 for qemu-devel@nongnu.org; Sat, 02 Nov 2019 04:33:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 762292A5A;
 Sat,  2 Nov 2019 09:33:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXsol_oFHD9z; Sat,  2 Nov 2019 09:33:01 +0100 (CET)
Received: from function (lfbn-bor-1-271-187.w109-215.abo.wanadoo.fr
 [109.215.110.187])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3F3771283;
 Sat,  2 Nov 2019 09:33:01 +0100 (CET)
Received: from samy by function with local (Exim 4.92.3)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1iQoqC-0002g1-MJ; Sat, 02 Nov 2019 09:33:00 +0100
Date: Sat, 2 Nov 2019 09:33:00 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Jordi Pujol <jordipujolp@gmail.com>
Subject: Re: [PATCH v4] smb daemon get additional command line parameters
 from env variable
Message-ID: <20191102083300.hm36idtj753ftbx4@function>
References: <CACTE=gpFbUSxXeTwu6_tzSeoh_9Yp905aMdzCPCUz3h7kcgeyw@mail.gmail.com>
 <144c1b0a-5cd4-b657-025b-f44d5e812e06@vivier.eu>
 <CACTE=goN=Nw8b5RN8sWhX9mRNWEU0fhuc=HnD3MJW59BET=hkA@mail.gmail.com>
 <20191031161547.pipit5hxzjnf6jmt@function>
 <CACTE=godCrD7GiPbOnds3uRgrVhrZYBY+Ojsa85EVd31pd6h1A@mail.gmail.com>
 <20191101145437.tr4gervnn2m5qvci@function>
 <CACTE=grkUZErGiW4=USWPS=Q4kpo1C8QupucnnS8ry3Z00DumQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACTE=grkUZErGiW4=USWPS=Q4kpo1C8QupucnnS8ry3Z00DumQ@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a0c:e300::1
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jordi Pujol, le sam. 02 nov. 2019 08:41:52 +0100, a ecrit:
> @@ -909,6 +910,12 @@ static int slirp_smb(SlirpState* s, cons
>               CONFIG_SMBD_COMMAND, s->smb_dir, smb_conf);
>      g_free(smb_conf);
> 
> +    options = g_getenv("SMBDOPTIONS");
> +    if (options) {
> +        smb_cmdline = g_strdup_printf("%s %s", smb_cmdline, options);
> +        g_free(options);
> +    }

Again, what g_getenv mustn't be freed. I believe you even get a warning
about it: g_getenv returns a const gchar *.

The old value of smb_cmdline, however, has to be freed, otherwise that's
a memory leak.

Samuel

