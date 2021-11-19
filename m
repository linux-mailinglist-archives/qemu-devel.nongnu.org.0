Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855AF456C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:33:23 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Go-0003La-Dk
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:33:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo08J-0000CW-KF
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo08H-0006mP-CH
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5PgIM7t0ko7eR9oN9zN7gzDRIip4K6lcgtzTyspJ1I=;
 b=DkbYLJ8TlbFjRMaCxZDm17zSeR2NDxU8xFKlpE5Mo6nY6ixMEtmYTyQox7gO2ieM8dBCGR
 /mOTd7ljt0d9YeEe9M07nlHCqhSHiJ+6ziAGJ70qi2Sea7wQdQaJoWWpBXrSOKOq/7sgfv
 Jfu5XqCC5iUfcbAUNGS9GrhCGYS0ya0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507--p5u7h5UNcO4x63D8wJbnQ-1; Fri, 19 Nov 2021 04:24:28 -0500
X-MC-Unique: -p5u7h5UNcO4x63D8wJbnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891EF1006AA0;
 Fri, 19 Nov 2021 09:24:27 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21419604CC;
 Fri, 19 Nov 2021 09:24:08 +0000 (UTC)
Message-ID: <0457933c-610d-0f78-7ae3-07648280e838@redhat.com>
Date: Fri, 19 Nov 2021 10:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ui/gtk: mon_num parameter to specify target monitor for
 launching Qemu
To: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel@nongnu.org
References: <20211118225127.26147-1-dongwon.kim@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211118225127.26147-1-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sweeaun <swee.aun.khor@intel.com>,
 Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 23:51, Dongwon Kim wrote:
> +# @mon-num:     Indicate monitor where Qemu window is lauched. mon-num
> +#               could be any number from -1 to (total num of monitors - 1).
> +#               (default: -1: use default monitor)
> +#               since 6.2

There is no need to accept -1; the opts->u.gtk struct uses a separate 
boolean field to indicate the default.  Instead, the parameter should be 
an unsigned integer ("uint32").

Also please use "monitor", not "mon-num".  We usually avoid abbreviations.

> +    if (opts->u.gtk.has_mon_num && opts->u.gtk.mon_num &&
> +        opts->u.gtk.mon_num >= 0) {

Rejecting 0 ("opts->u.gtk.mon_num") is incorrect.  If you declare it as 
unsigned, you can just use "if (opts->u.gtk.has_mon_num").

Thanks,

Paolo

> +        GdkRectangle mon_dest;
> +        if (opts->u.gtk.mon_num < gdk_display_get_n_monitors(window_display)) {
> +            gdk_monitor_get_geometry(
> +                gdk_display_get_monitor(window_display, opts->u.gtk.mon_num),
> +                &mon_dest);
> +            gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
> +        }
> +    }
>       if (opts->has_full_screen &&
>           opts->full_screen) {
>           gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
> -- 


