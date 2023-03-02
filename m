Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF956A7CCD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:35:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHA-0005fx-Cb; Thu, 02 Mar 2023 03:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGf-0005Vk-0A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGd-0002Sb-01
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BR6VzSroAnj+YfgqBaTcp9B8XN+Lg1AvIIAhtX3hqJc=;
 b=CUbpBTGMAZGxngFiaP3KCUu3OuACkY7wzAELsvxVzSqcO9XwvwvdYGUprzzTDYWQ1Ht5eo
 IqhLC6+x16TeOoWYFOzoYWn280qQ8FiD0Mb4WjZ7ecpgUqQ0nARFHJNWyBzW7HBXNO6QUt
 WhtHfawqUZAsT/vCrGKBY9ouNOoPLLQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-vSf_IAvyN6KqmN1HCu_eTw-1; Thu, 02 Mar 2023 03:26:21 -0500
X-MC-Unique: vSf_IAvyN6KqmN1HCu_eTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so5461009wml.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745579;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BR6VzSroAnj+YfgqBaTcp9B8XN+Lg1AvIIAhtX3hqJc=;
 b=3pE9ldg0g88nJNB9TBUZnnwGWU2oVVPcLb8EX6RSnNMAO3c/4z+XN4ky7YjEU0aiHm
 aaCxcU/zyRy7lA95wGhPoKr4NwBOA6U0r2Kq2vbCUpfbzXJhuyc6kI+cphVVDMRirSxT
 0k/4QxGfUyliI/rspXEdK0pdML3vRb4A94sxQz4CtmjqyiwK4U/i2kVBvTMZ3dX0WoQw
 0lxl4mi5zGvQ22PacduLmcd/qMTsXAZDn1Hv5BanURrlYzFJCZx7I4625wSGbqcK9Vdv
 2XcicXk3CZ3WRIO0evn58kt5jNCWW+TB1r4yMYZziIYjmmX5PKRuttHxwFapH3R4BaEy
 t0yA==
X-Gm-Message-State: AO0yUKWDjaTlbFeXj2U03UpdlJUTE/KXavw+HyH7nM615NFFZ0F5EV29
 T8uyIqUo6NJAJ+l16iJ56+n4+VfU6hec4zGe+2gW5syP1VDC5t9YHSe2oZBCCswXGi15zmIUV46
 s1mKjeb12VP/6aTw/AG5LsAJsQBcZzdde79PyJUgskVcij6LZgpmkCTccWp+6IlAYwg==
X-Received: by 2002:a5d:5689:0:b0:2cd:de25:1c76 with SMTP id
 f9-20020a5d5689000000b002cdde251c76mr823928wrv.17.1677745579724; 
 Thu, 02 Mar 2023 00:26:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/sQbyO2Y87yBZsG5PkwUlkgwiYvR2jmWdc9be9hNnGA7gZ03Z7ra8QZ7rNlvHFoIKTuI8C0Q==
X-Received: by 2002:a5d:5689:0:b0:2cd:de25:1c76 with SMTP id
 f9-20020a5d5689000000b002cdde251c76mr823908wrv.17.1677745579446; 
 Thu, 02 Mar 2023 00:26:19 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm2251753wmn.27.2023.03.02.00.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:18 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Yajun@redhat.com, Wu@redhat.com, &lt@redhat.com, Jiri@redhat.com,
 Pirko@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 35/53] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
Message-ID: <20230302082343.560446-36-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

After live migration with virtio block device, qemu crash at:

	#0  0x000055914f46f795 in object_dynamic_cast_assert (obj=0x559151b7b090, typename=0x55914f80fbc4 "qio-channel", file=0x55914f80fb90 "/images/testvfe/sw/qemu.gerrit/include/io/channel.h", line=30, func=0x55914f80fcb8 <__func__.17257> "QIO_CHANNEL") at ../qom/object.c:872
	#1  0x000055914f480d68 in QIO_CHANNEL (obj=0x559151b7b090) at /images/testvfe/sw/qemu.gerrit/include/io/channel.h:29
	#2  0x000055914f4812f8 in qio_net_listener_set_client_func_full (listener=0x559151b7a720, func=0x55914f580b97 <tcp_chr_accept>, data=0x5591519f4ea0, notify=0x0, context=0x0) at ../io/net-listener.c:166
	#3  0x000055914f580059 in tcp_chr_update_read_handler (chr=0x5591519f4ea0) at ../chardev/char-socket.c:637
	#4  0x000055914f583dca in qemu_chr_be_update_read_handlers (s=0x5591519f4ea0, context=0x0) at ../chardev/char.c:226
	#5  0x000055914f57b7c9 in qemu_chr_fe_set_handlers_full (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false, sync_state=true) at ../chardev/char-fe.c:279
	#6  0x000055914f57b86d in qemu_chr_fe_set_handlers (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false) at ../chardev/char-fe.c:304
	#7  0x000055914f378caf in vhost_user_async_close (d=0x559152bf21a0, chardev=0x559152bf23a0, vhost=0x559152bf2420, cb=0x55914f2fb8c1 <vhost_user_blk_disconnect>) at ../hw/virtio/vhost-user.c:2725
	#8  0x000055914f2fba40 in vhost_user_blk_event (opaque=0x559152bf21a0, event=CHR_EVENT_CLOSED) at ../hw/block/vhost-user-blk.c:395
	#9  0x000055914f58388c in chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:61
	#10 0x000055914f583905 in qemu_chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:81
	#11 0x000055914f581275 in char_socket_finalize (obj=0x5591519f4ea0) at ../chardev/char-socket.c:1083
	#12 0x000055914f46f073 in object_deinit (obj=0x5591519f4ea0, type=0x5591519055c0) at ../qom/object.c:680
	#13 0x000055914f46f0e5 in object_finalize (data=0x5591519f4ea0) at ../qom/object.c:694
	#14 0x000055914f46ff06 in object_unref (objptr=0x5591519f4ea0) at ../qom/object.c:1202
	#15 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b76c50, name=0x559151b7b250 "char3", opaque=0x5591519f4ea0) at ../qom/object.c:1747
	#16 0x000055914f46ee86 in object_property_del_all (obj=0x559151b76c50) at ../qom/object.c:632
	#17 0x000055914f46f0d2 in object_finalize (data=0x559151b76c50) at ../qom/object.c:693
	#18 0x000055914f46ff06 in object_unref (objptr=0x559151b76c50) at ../qom/object.c:1202
	#19 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b6b560, name=0x559151b76630 "chardevs", opaque=0x559151b76c50) at ../qom/object.c:1747
	#20 0x000055914f46ef67 in object_property_del_child (obj=0x559151b6b560, child=0x559151b76c50) at ../qom/object.c:654
	#21 0x000055914f46f042 in object_unparent (obj=0x559151b76c50) at ../qom/object.c:673
	#22 0x000055914f58632a in qemu_chr_cleanup () at ../chardev/char.c:1189
	#23 0x000055914f16c66c in qemu_cleanup () at ../softmmu/runstate.c:830
	#24 0x000055914eee7b9e in qemu_default_main () at ../softmmu/main.c:38
	#25 0x000055914eee7bcc in main (argc=86, argv=0x7ffc97cb8d88) at ../softmmu/main.c:48

In char_socket_finalize after s->listener freed, event callback function
vhost_user_blk_event will be called to handle CHR_EVENT_CLOSED.
vhost_user_blk_event is calling qio_net_listener_set_client_func_full which
is still using s->listener.

Setting s->listener = NULL after object_unref(OBJECT(s->listener)) can
solve this issue.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>

Message-Id: <20230214021430.3638579-1-yajunw@nvidia.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Yajun Wu &lt;<a href="mailto:yajunw@nvidia.com" target="_blank">yajunw@nvidia.com</a>&gt;<br>
Acked-by: Jiri Pirko &lt;<a href="mailto:jiri@nvidia.com" target="_blank">jiri@nvidia.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Marc-André Lureau &lt;<a href="mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br> </div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 chardev/char-socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c2265436ac..8c58532171 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1065,6 +1065,7 @@ static void char_socket_finalize(Object *obj)
         qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
                                               NULL, chr->gcontext);
         object_unref(OBJECT(s->listener));
+        s->listener = NULL;
     }
     if (s->tls_creds) {
         object_unref(OBJECT(s->tls_creds));
-- 
MST


