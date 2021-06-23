Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41053B1A79
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:48:24 +0200 (CEST)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Ip-0007Kf-OC
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw2Fd-0003ds-Av
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:45:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw2Fb-00047m-Lq
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624452303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mssxwO5VfwNYG126OHrwaX7jD77/wCN/UG5VpRHhN4Y=;
 b=MXTH+J0j57ef4rA4b6yP4XfmynrMivnW5puilW+5tXFhJgmi7Lc1ML2DleiLk13XNGwgi6
 JmEFXS9GoY8F/MA5Gdh5f+qLfPwaRwquau5R3wVI2fskW05LlThlGydvHH+8c4G2lSb7Wo
 MEb4c9P7d3R5oZ/ptrgYt4sTSpeZ1zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-49I8ZsoKOOCYb3QJTUejKw-1; Wed, 23 Jun 2021 08:45:01 -0400
X-MC-Unique: 49I8ZsoKOOCYb3QJTUejKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C544C804146;
 Wed, 23 Jun 2021 12:45:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFEC1017CE7;
 Wed, 23 Jun 2021 12:45:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 033C8180060E; Wed, 23 Jun 2021 14:44:58 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:44:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 1/1] input: Add lang1 and lang2 to QKeyCode
Message-ID: <20210623124458.xosrj76tyowk44ls@sirius.home.kraxel.org>
References: <20210617023113.2441-1-akihiko.odaki@gmail.com>
 <20210617023113.2441-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210617023113.2441-2-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 11:31:13AM +0900, Akihiko Odaki wrote:
> lang1 and lang2 represents the keys with the same names in the
> keyboard/keypad usage page (0x07) included in the "HID Usage Tables for
> Universal Serial Bus (USB)" version 1.22. Although the keys are
> described as "Hangul/English toggle key" and "Hanja conversion key" in
> the specification, the meaning depends on the variety of the keyboard,
> and it will be used as the representations of Kana and Eisu keys on
> Japanese Macs in qemu_input_map_osx_to_qcode, which is used by ui/gtk.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to UI queue.

thanks,
  Gerd


