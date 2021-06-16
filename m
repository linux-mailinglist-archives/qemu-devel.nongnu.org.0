Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F233AA26F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:34:24 +0200 (CEST)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZQl-0000jI-Ez
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltZPj-0007nL-NI
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltZPg-0007WW-BZ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623864794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TZIxPeHed0JejS2oGZ4t+v6laN6CsKlCiMwrisaC78=;
 b=CYvrXeNbyjyKJzgH6JAShy+w0mCIBEZbd2/iW7arxqt82+w9MfZFxXR7/5APeiaItwq7kQ
 MYicJyqIlOkoFHQCGx5y6ucISA0smq6JxpZxpNwUWpcTzSj1Sg6QCg4oTXKn68UsUN5FEm
 dvfa0BB+RHh05gWjie8HR05Zzpsri7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-TrEo4-Y0P5GP4yZlzPQp2g-1; Wed, 16 Jun 2021 13:33:02 -0400
X-MC-Unique: TrEo4-Y0P5GP4yZlzPQp2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C40E803622;
 Wed, 16 Jun 2021 17:33:01 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6923518B4B;
 Wed, 16 Jun 2021 17:32:57 +0000 (UTC)
Date: Wed, 16 Jun 2021 12:32:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 1/1] input: Add lang1 and lang2 to QKeyCode
Message-ID: <20210616173255.gcrwwhssdtkbfi5w@redhat.com>
References: <20210616144522.55643-1-akihiko.odaki@gmail.com>
 <20210616144522.55643-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210616144522.55643-2-akihiko.odaki@gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 11:45:22PM +0900, Akihiko Odaki wrote:
> lang1 and lang2 represents the keys with the same names in the
> keyboard/keypad usage page (0x07) included in the "HID Usage Tables for
> Universal Serial Bus (USB)" version 1.22. Although the keys are
> described as "Hangul/English toggle key" and "Hanja conversion key" in
> the specification, the meaning depends on the variety of the keyboard,
> and it will be used as the representations of Kana and Eisu keys on
> Japanese Macs in qemu_input_map_osx_to_qcode, which is used by ui/gtk.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  qapi/ui.json | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index ee6fde46d59..3b16b2191cc 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -786,6 +786,9 @@
>  # @muhenkan: since 2.12
>  # @katakanahiragana: since 2.12
>  #
> +# @lang1: since 6.0.50
> +# @lang2: since 6.0.50

since 6.1

(6.0.50 is a convenience used during development, but does not point
to any released build; for that matter, it doesn't even point to a
constant commit over time the way 6.1 does).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


