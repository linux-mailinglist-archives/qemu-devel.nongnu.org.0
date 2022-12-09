Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CD648197
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bUd-0003xI-3y; Fri, 09 Dec 2022 06:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUX-0003wX-Ie
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUS-0000x2-Ay
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFtN8VunDV27fIl33PQfEOOcY8O2Ez7sdebsJhL3MAw=;
 b=IW0rFNCBMPQX8zKRaG+9cKuK7U8xiat1jmbwvPWl3cHVt2EDYE2I+Sw4Uwyk3hsVT7eqaI
 AfQNfqXzLnsUvvoTqpZ54xT4+fv6Nro4WayStYC2EqZ/yiP8dJ0UDuGg1bQRKcHS1TNfbV
 4cALf/ESLkPjoEj7eV/kERJaDDb/AYs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-nqOR4a6RMM69hf7b4gsWKw-1; Fri, 09 Dec 2022 06:24:18 -0500
X-MC-Unique: nqOR4a6RMM69hf7b4gsWKw-1
Received: by mail-ej1-f72.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so2902605ejc.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WFtN8VunDV27fIl33PQfEOOcY8O2Ez7sdebsJhL3MAw=;
 b=nrVdKDp6/Fuzt29JI1KyjaxhYtVw9vg99WLMKbyLgMsZTg9BVhB0JWS1wvkN2cdVlt
 WYTTjqbMwN28Pph5gY6EZfWbxEwFHcGBDBRdQMXaEMd0RFLzn5gFRO3iWQuOQwqK2QrZ
 smlP03LCkMNLSDzl+0q/v5Zko7KwwCm8AvOboB/0TUKQDaaKeaxLudXqjtM4AklqixlZ
 o6isEerC4Y/jBjFgzmbagxUyIEAqvEDx8dEDmHyyJXhmtOFdzLNQSDe8uKD4f8JXmNCd
 WIf6yjXv+OfBxUuxSLO1HeLIQtq2j1/WKBCwUfeQtBlV60q7fSCKq5KSam01y+g+P7Pv
 fmFw==
X-Gm-Message-State: ANoB5pmKDnzCth4fLdSvAHXOaoMwFOBuiS6BHSpVWC2T2Q93InFog5Ov
 VQRyZGcg0En+T3Qu7kXvIo2vk66dTvAZop2L5N+Yl9aOyoCPZuVKrxixbyu7PNTkQ6qZJCWXWW2
 Yz9LH+jhFSmuOEQ0BEw5FvcBlKYOGnefuWn05AEbRFy8k1SNQAG6cw//hMWYCEXPekuc=
X-Received: by 2002:a17:906:d18f:b0:7b2:75c6:6d3c with SMTP id
 c15-20020a170906d18f00b007b275c66d3cmr4738112ejz.74.1670585056912; 
 Fri, 09 Dec 2022 03:24:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6jbROFRlAzlDcWAd3ksGsDLTGs9j9u6gp6L3q+sJFvpnGjB/tYS2TScAl9YPB77y1ADyQyWQ==
X-Received: by 2002:a17:906:d18f:b0:7b2:75c6:6d3c with SMTP id
 c15-20020a170906d18f00b007b275c66d3cmr4738095ejz.74.1670585056587; 
 Fri, 09 Dec 2022 03:24:16 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kv2-20020a17090778c200b007b2b98e1f2dsm438832ejc.122.2022.12.09.03.24.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/30] configure: remove dead function
Date: Fri,  9 Dec 2022 12:23:41 +0100
Message-Id: <20221209112409.184703-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index e31d4522ea63..543fd5a48bf0 100755
--- a/configure
+++ b/configure
@@ -210,10 +210,6 @@ version_ge () {
     done
 }
 
-glob() {
-    eval test -z '"${1#'"$2"'}"'
-}
-
 if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
 then
   error_exit "main directory cannot contain spaces nor colons"
-- 
2.38.1


