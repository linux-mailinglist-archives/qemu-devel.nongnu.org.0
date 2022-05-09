Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729BD51FA1F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:40:12 +0200 (CEST)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0oF-0004hz-67
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ew-0004Gr-Kg
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0ev-0002lZ-2w
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izAfP/QtznA3u1TE1I3jkt0p4z5pNFEZWn9uB+9n4wQ=;
 b=EClEBL939pFqiD+DjYIDGtlObTd2pTVx9KygrG11IuphHoa7Im7sNsJdWSVm91/ulFdOD/
 1UF3ed1VziKbr+890mV36nPe+XEo3PH4dp3TOGoAj5Z8oQxT13TiPnjFHfcl53EvANhgh2
 XatXnr5f1ZWKRLdAnpFL0g8DtJ19Is8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-ubp6k_HPPSCXi0SUPK0KYA-1; Mon, 09 May 2022 06:30:31 -0400
X-MC-Unique: ubp6k_HPPSCXi0SUPK0KYA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so5580595wrv.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izAfP/QtznA3u1TE1I3jkt0p4z5pNFEZWn9uB+9n4wQ=;
 b=xbhjpquTSXgDPblkadhdWYLVDp+aOCUhCNHDa8MIYGFI+CRjnpj+LziQEwfqLshjxk
 bLVBVpM+FDXFARFlUNZoH1fbChTwOzHeeEn8HPzdqCw8vq3xXOp06tJAJbJwsH5nkVFB
 Kxm8al20TXjqzVTkb2pVrNw6dP2LlCP/P7Suj5glNcC+/tKp/Mo3UUNFkmGaku0gGeiX
 FmQxde8a8gRDlhi8vFuqoM+63yOyDtm3MnPhMIfROwhThnumbq0hj1GFzpQ7p8ShOPqh
 0JGEIgfTKuCKWHlUFOqhhRtMxhwiPA95M6FSB7pSGK7x+PwOMW9ivvi76G4jxtK+Htf4
 uoRg==
X-Gm-Message-State: AOAM531nTcnPIuBoY0XaE/DGgOwO4rhrbIe+Ag2zzM1eE9WubXUVMHqP
 V8/jCrRFTZEHpKotQSkzA2bPigQcrQiu8PkYYYmXmy0Qaa3zZcs2J/ILD61rF0iyaH0uJ5EKbn0
 xR2Xwz+NX1fub2lSptIVYFEwDQKdFUrBM/WwXtJfp1fzZShyrsnxTT5DyXpWBTnQbuTs=
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr12986905wrd.443.1652092229400; 
 Mon, 09 May 2022 03:30:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNzq8N2ULTUCYgcsu4RNmAEKBPaJ60iwTUxLVGh955iX4LLkvjrvG+vOJt6dKB0N2rbIyTsw==
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr12986874wrd.443.1652092228961; 
 Mon, 09 May 2022 03:30:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d52cc000000b0020c5253d8c0sm10668459wrv.12.2022.05.09.03.30.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/26] nbd: remove incorrect coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:56 +0200
Message-Id: <20220509103019.215041-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nbd_co_establish_connection_cancel() cancels a coroutine but is not called
from coroutine context itself, for example in nbd_cancel_in_flight()
and in timer callbacks reconnect_delay_timer_cb() and open_timer_cb().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/nbd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index a98eb665da..5c3710fa52 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -423,6 +423,6 @@ QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                             bool blocking, Error **errp);
 
-void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
 #endif
-- 
2.35.1


