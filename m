Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A24109C23
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:17:39 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZXub-0006q0-Lj
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prashantbhole.linux@gmail.com>) id 1iZXru-0005R4-E7
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:14:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prashantbhole.linux@gmail.com>) id 1iZXmE-0002z4-IJ
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:08:59 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prashantbhole.linux@gmail.com>)
 id 1iZXmE-0002xx-Ce
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:08:58 -0500
Received: by mail-pl1-x643.google.com with SMTP id s10so7940095plp.2
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 02:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/KNFyebQK7C43tEw7YnjUgOQj/Np7ljq5WcxHdrR0c=;
 b=dzBZCOnaWE7Ha7XRUgoI1TMso7rPaEIgzx/qbfK80VCj2jnRcx784yIM+tcJz7c1W4
 SX24el6V4d3P89iqBPTFv2AmbDubMl9yoJqacCzuZhlnR3Bk050iQx1k6m6poXeq+bfl
 nCsgtrM1+U9l5Ye2fGXuufDnG0O2Gs/JqEuATOJ5p/18g7oqYF+NooT1+Mdardio8ul3
 GV1l4Qd/F5C3N0Vmi+3MI6zR9VuP0jtaYWvbvIgF8HfBcTH1gioMVf0mIhU757jNqbji
 SVXIEm14A7LiPCXAPyyVnHOhayKjwJrvX2PGeac7T9Z21XmzwuLidD9Nq6gJQVhxwP8a
 f/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/KNFyebQK7C43tEw7YnjUgOQj/Np7ljq5WcxHdrR0c=;
 b=Pju+rV+p1Oz87vMF9ZlgFkVVFlN9NN3x0zH7KMxO63TES7cGEWK0KiEUj/E8Eow1WZ
 eZvi7P0Pc8X7jWwcLRa7AExfXyeaXnf9xQTw/7GbBtUgYgrpOYDgI1DvtUZyNhZidDhc
 PLngrDtk8tRKYFSEIL7zKER6+1cCq30IcmBZ0/H+yGRvPlrMYoPPKmRAFl9uA6VaLvs+
 86GTFq1iCrXxQBHG2mrZs4W6UvjLrUyyvj9xBuc9CRBp+9/AzYrJ6PAAKSTSjfnT4y8S
 MyLXCbSxsxW7DRtMYSu5gv2tFlX+nD9NNgCQMlm59RmjFbnspDFUlXSKPDhPHdjD5TOr
 Z/qA==
X-Gm-Message-State: APjAAAVCaXLy1g2jWzcpRGwWOQtENj4FYp3TA7+THYF/iY73I8NEAoRP
 kuLtym42bM90mb4GY1tIct4=
X-Google-Smtp-Source: APXvYqwzcOMViqGh/CDqZ6GTDBF1yWFhOG4mwf7CZlGyeqi/dlAtJKkC4MdApMy1ZQ7I10+ijRtVKw==
X-Received: by 2002:a17:90a:d58e:: with SMTP id
 v14mr5946678pju.142.1574762937533; 
 Tue, 26 Nov 2019 02:08:57 -0800 (PST)
Received: from localhost.localdomain ([222.151.198.97])
 by smtp.gmail.com with ESMTPSA id s24sm11848485pfh.108.2019.11.26.02.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 02:08:57 -0800 (PST)
From: Prashant Bhole <prashantbhole.linux@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [RFC net-next 04/18] tuntap: check tun_msg_ctl type at necessary
 places
Date: Tue, 26 Nov 2019 19:07:30 +0900
Message-Id: <20191126100744.5083-5-prashantbhole.linux@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126100744.5083-1-prashantbhole.linux@gmail.com>
References: <20191126100744.5083-1-prashantbhole.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, qemu-devel@nongnu.org,
 Prashant Bhole <prashantbhole.linux@gmail.com>, kvm@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tun_msg_ctl is used by vhost_net to communicate with tuntap. We will
introduce another type in soon. As a preparation this patch adds
conditions to check tun_msg_ctl type at necessary places.

Signed-off-by: Prashant Bhole <prashantbhole.linux@gmail.com>
---
 drivers/net/tap.c | 7 +++++--
 drivers/net/tun.c | 6 +++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 3ae70c7e6860..4df7bf00af66 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -1213,6 +1213,7 @@ static int tap_sendmsg(struct socket *sock, struct msghdr *m,
 	struct tap_queue *q = container_of(sock, struct tap_queue, sock);
 	struct tun_msg_ctl *ctl = m->msg_control;
 	struct xdp_buff *xdp;
+	void *ptr = NULL;
 	int i;
 
 	if (ctl && (ctl->type == TUN_MSG_PTR)) {
@@ -1223,8 +1224,10 @@ static int tap_sendmsg(struct socket *sock, struct msghdr *m,
 		return 0;
 	}
 
-	return tap_get_user(q, ctl ? ctl->ptr : NULL, &m->msg_iter,
-			    m->msg_flags & MSG_DONTWAIT);
+	if (ctl && ctl->type == TUN_MSG_UBUF)
+		ptr = ctl->ptr;
+
+	return tap_get_user(q, ptr, &m->msg_iter, m->msg_flags & MSG_DONTWAIT);
 }
 
 static int tap_recvmsg(struct socket *sock, struct msghdr *m,
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 683d371e6e82..1e436d9ec4e1 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -2529,6 +2529,7 @@ static int tun_sendmsg(struct socket *sock, struct msghdr *m, size_t total_len)
 	struct tun_struct *tun = tun_get(tfile);
 	struct tun_msg_ctl *ctl = m->msg_control;
 	struct xdp_buff *xdp;
+	void *ptr = NULL;
 
 	if (!tun)
 		return -EBADFD;
@@ -2560,7 +2561,10 @@ static int tun_sendmsg(struct socket *sock, struct msghdr *m, size_t total_len)
 		goto out;
 	}
 
-	ret = tun_get_user(tun, tfile, ctl ? ctl->ptr : NULL, &m->msg_iter,
+	if (ctl && ctl->type == TUN_MSG_UBUF)
+		ptr = ctl->ptr;
+
+	ret = tun_get_user(tun, tfile, ptr, &m->msg_iter,
 			   m->msg_flags & MSG_DONTWAIT,
 			   m->msg_flags & MSG_MORE);
 out:
-- 
2.20.1


