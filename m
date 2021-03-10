Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA53342F0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:20:48 +0100 (CET)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Zn-0005bq-AC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1I0-0005S3-0O
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hq-0003WJ-HW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3xaH0TWbEO7Mh01q5cRC27I0HaUzq5ELvE0IDN8LPc=;
 b=F1wyuvJQqlk/h/OzPgxvAZEp6YXv6ZHbbgxWTKQxtZ2dD6+GWvu6IAcvCp6kWnJMe/SNKc
 333zhbLryMCfkmbaROGDFLovW3LWb0tnOXbD7Agem+V1R08uUuAMxrRR0ZJlrbi1An3RS8
 qQuxs71DgokjixRrdyQT94ye3pUui84=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-m0r-UiyUMAS0A4qE3H361A-1; Wed, 10 Mar 2021 11:02:00 -0500
X-MC-Unique: m0r-UiyUMAS0A4qE3H361A-1
Received: by mail-ej1-f69.google.com with SMTP id li22so2910908ejb.18
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3xaH0TWbEO7Mh01q5cRC27I0HaUzq5ELvE0IDN8LPc=;
 b=qKcIqkYxTq9xw0MUz/gHzFjSbsvXXOHeLNLQYPgIN+e0E2F+Mq08apmHQQo6z66n7/
 MHukAxkfJ9MvEczRthZ+czfmHnLLdGgzKbKWnMylCCN1DF5ZtuwAZkkLs7bF+uVc8Tlq
 W7VgErry7exxZKRZgapbqzHz7Cv5wmGsqd4q6qwO17sRg++j7LEmyg222NT/L7yxAcNH
 hzsYrEo5QdqGUokz9Vg5kNLiGe9KoNCqt1iv+1ZI4ePqaEMtKVhoefjKklkSksOr8K1i
 kB5U5eK/aM61IgYoyJM8Dx+QddP59CeklpeXNPlC0Jzg1CcBxPL1HcNW/y1oJanvZ/BD
 YmZQ==
X-Gm-Message-State: AOAM533r3vvVKi6UMQafUTtm79BZJSJ6tCV+8iIsZvCWlRJFPWdLzWHr
 lj+2/YhtjyrjZ5yW+OaXU0XHRqGfL5AxqkONeVCBOxu+mGEMNm7QNer5Ee1h6Lb6elwFGSVeOst
 SUe38y2SXswQIN3DnY6jpSlXK5nrSLhYQCVPEITImkI7eulbs6dLjsc0cjWL3dI7O
X-Received: by 2002:a17:906:684b:: with SMTP id
 a11mr4252097ejs.329.1615392114669; 
 Wed, 10 Mar 2021 08:01:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya64dRK5SMgu8YnTkmqmESDBriI7BUsWzsvLm+e3mD1nvxOWGHfnNrQ5WFAKM3XvdVx4ATgA==
X-Received: by 2002:a17:906:684b:: with SMTP id
 a11mr4252033ejs.329.1615392114018; 
 Wed, 10 Mar 2021 08:01:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e26sm11940282edj.29.2021.03.10.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:01:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] net/eth: Make ip6_ext_hdr *ext_hdr pointer to const
Date: Wed, 10 Mar 2021 17:01:31 +0100
Message-Id: <20210310160135.1148272-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310160135.1148272-1-philmd@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the callee doesn't need to modify the ext_hdr buffer,
mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index 6a5a1d04e0b..7c47a267a7a 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -402,7 +402,7 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
 static bool
 _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                         size_t ext_hdr_offset,
-                        struct ip6_ext_hdr *ext_hdr,
+                        const struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
-- 
2.26.2


