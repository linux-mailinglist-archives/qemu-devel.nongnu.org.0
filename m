Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C487630E5F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:22:33 +0100 (CET)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7QXg-00077y-EZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1l7QWB-0006ff-Et
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:20:59 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1l7QW9-0001zy-QO
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:20:59 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7CABBF2;
 Wed,  3 Feb 2021 23:20:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWsUyYCv1HKR; Wed,  3 Feb 2021 23:20:54 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C55F675;
 Wed,  3 Feb 2021 23:20:54 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1l7QW5-00ArL2-UP; Wed, 03 Feb 2021 23:20:53 +0100
Date: Wed, 3 Feb 2021 23:20:53 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v2 2/2] net: Add -ipv6-hostfwd option,
 ipv6_hostfwd_add/remove commands
Message-ID: <20210203222053.htsym7musxnqpc5n@begin>
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-3-dje@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210203213729.1940893-3-dje@google.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7CABBF2
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; RCPT_COUNT_TWO(0.00)[2];
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doug Evans, le mer. 03 févr. 2021 13:37:29 -0800, a ecrit:
> @@ -1392,6 +1392,34 @@ SRST
>    Remove host-to-guest TCP or UDP redirection.
>  ERST
>  
> +#ifdef CONFIG_SLIRP
> +    {
> +        .name       = "ipv6_hostfwd_add",
> +        .args_type  = "arg1:s,arg2:s?",
> +        .params     = "[netdev_id] [tcp|udp]:[hostaddr6]:hostport-[guestaddr6]:guestport",

Perhaps explicit that the IPv6 address should be enclosed with [] ?

> +    /* Ignore the part between the ']' and addr_sep. */
> +    if (get_str_sep(buf, sizeof(buf), &p, addr_sep) < 0) {

Mmm, I would say that we do not want to just ignore it, and rather make
sure that it is empty, so that we can possibly make extensions later
without breaking existing misuse.

Samuel

