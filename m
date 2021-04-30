Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE636F663
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:28:04 +0200 (CEST)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNZD-0007rn-2u
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNXF-00068F-Qp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNXD-00089m-Ej
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619767558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4kRnvDPPFGd2xJOR91+Cf8YaoJL/b2AWGlgAD0DQII=;
 b=ZjFaHB+0iBWmpAPT9L57jpH3ajxt6PMrhjgSmqOQsC/C3mJTrCsGIDrN49xFPiw4YjLFSQ
 AUEGw3Ar7bEvUMk6i+HUMbWDoAcX349QNauWe0Cbc74uywyYSltn+8L5vCZEeKJKgKDAo4
 c0/ZYVzPDPy1z/Fydsu3W2Z2sAfMDMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-8YDfiNoyO9StUOYa2arZOw-1; Fri, 30 Apr 2021 03:25:54 -0400
X-MC-Unique: 8YDfiNoyO9StUOYa2arZOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 383C0107ACCA;
 Fri, 30 Apr 2021 07:25:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8D319C45;
 Fri, 30 Apr 2021 07:25:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8567F113525D; Fri, 30 Apr 2021 09:25:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-3-gustavo@noronha.eti.br>
Date: Fri, 30 Apr 2021 09:25:47 +0200
In-Reply-To: <20210429234705.83206-3-gustavo@noronha.eti.br>
 (gustavo@noronha.eti.br's message of "Thu, 29 Apr 2021 20:47:05
 -0300")
Message-ID: <87r1is5j44.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gustavo@noronha.eti.br writes:

> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
>
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> swaps them around so that Alt is the key closer to the space bar and Meta/Super
> is between Control and Alt, like on non-Mac keyboards.
>
> It is a cocoa display option, enabled by default.
>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> ---
>  qapi/ui.json    |  7 +++++-
>  qemu-options.hx |  1 +
>  ui/cocoa.m      | 66 +++++++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 77bc00fd0d..02db684251 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1098,9 +1098,14 @@
   ##
   # @DisplayCocoa:
   #
   # Cocoa display options.
   #
   # @full-grab:       Capture all key presses, including system combos. This
   #                   requires accessibility permissions, since it performs
>  #                   a global grab on key events. (default: off)
>  #                   See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>  #
> +# @swap-option-command: Swaps the Option and Command keys so that their key codes

Please use imperative mood consistently: "Swap", like "Capture" above.

> +#                       match their position on non-Mac keyboards and you can use
> +#                       Meta/Super and Alt where you expect them. (default: on)
> +#

Drop the blank comment line, and break your lines a bit earlier.

>  ##

Like this:

   ##
   # @DisplayCocoa:
   #
   # Cocoa display options.
   #
   # @full-grab:       Capture all key presses, including system combos. This
   #                   requires accessibility permissions, since it performs
   #                   a global grab on key events. (default: off)
   #                   See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
   #
   # @swap-option-command: Swap the Option and Command keys so that their key
   #                       codes match their position on non-Mac keyboards and
   #                       you can use Meta/Super and Alt where you expect
   #                       them. (default: on)
   ##


>  { 'struct'  : 'DisplayCocoa',
> -  'data'    : { '*full-grab'     : 'bool' } }
> +  'data'    : { '*full-grab'           : 'bool',
> +                '*swap-option-command' : 'bool' } }
>  
>  ##
>  # @DisplayType:

With the doc comment tidied up, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


