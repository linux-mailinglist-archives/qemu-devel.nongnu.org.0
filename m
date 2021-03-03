Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9832B9D8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:28:08 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWEB-0004qf-8V
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9T-0005ho-7w
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9R-0000eQ-G9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+d/MBqh7nLsyh5fOlU8/TcU9o+BUbPZsFEks8VNenw=;
 b=GzI6C4Cvsc/uzKqojbgkkOx7lG84W1PnvcKN3CNzl+VHGduN/6qzMRgZvgE2WoabQUWA1z
 2jzir/JlKH2kMzfUiOmmgHKreY5K1ytNAnK+jWSbeQzdZ3ci6zhW3TbaKA6axS4k8QjMpW
 Hnk7McH7i+2ze43e1tHoiJUrmv4oO7s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-ikHgjMOiPXeeHPKsGsw8zA-1; Wed, 03 Mar 2021 13:23:09 -0500
X-MC-Unique: ikHgjMOiPXeeHPKsGsw8zA-1
Received: by mail-wr1-f70.google.com with SMTP id z6so4439275wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+d/MBqh7nLsyh5fOlU8/TcU9o+BUbPZsFEks8VNenw=;
 b=qd+kkAxXQKLxCsgYG09mXJmvp24pNOlm1q4dTisqi21zebOG1oc3C/Fkp0DbkeVwQq
 V6+Rzux9kYqT20v6eil9bw6dipt8uCJqMepQ+fd848FjSTn4ajkqbgTJeoFFEMvCrBSK
 Bw0eD5yZbD5kse7OYmSnKFFr1SBAzOMsEfW+L9qjacD8TZdpxbLTsLWBoFPk5gEeeSgf
 RZRmjusewcemQ5q/riB2/vekd0cPCSw96smRrCc0G8kEnCYqDmcArOLE/a7JsXFEuM4H
 +IWW9aOdpn54yOY740VUJTTy17KeKMypvdQx2aiHcmXPTAk+CkFp83M4sAq2IiqWKCXy
 4XKQ==
X-Gm-Message-State: AOAM531jivu8BsoatYufzpOPbSOdxTFH9gOecRDWRZLbnidDZdCLDE/E
 AEAVzxjcKJJK6rfNLKDwcZlm3UmPwzi39QYSlDP/l6mrkU8UZVMKx58tPrvYGMjsvuOyITprg/T
 OYKx1VoIABnPJZC1Ukgyahr9UZhfrO7xQFJ7tCkNYtHcs6ThzMzrpWYupAR25iusm
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr14888wra.250.1614795787557;
 Wed, 03 Mar 2021 10:23:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6ujFjRNPggv7/ipzC5oDJujEI5QYZFdlngvKsuonznRYeYLKD8t2BL7D3qvATAQ4rzlY2SQ==
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr14791wra.250.1614795786594;
 Wed, 03 Mar 2021 10:23:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm33245959wrt.68.2021.03.03.10.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/19] accel/whpx: Rename struct whpx_vcpu ->
 AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:07 +0100
Message-Id: <20210303182219.1631042-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current 'struct whpx_vcpu' contains the vCPU fields
specific to the WHPX accelerator. Rename it as AccelvCPUState.
We keep the 'whpx_vcpu' typedef to reduce the amount of code
changed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 6469e388b6d..f0b3266114d 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -148,9 +148,9 @@ struct whpx_register_set {
     WHV_REGISTER_VALUE values[RTL_NUMBER_OF(whpx_register_names)];
 };
 
-typedef struct whpx_vcpu whpx_vcpu;
+typedef struct AccelvCPUState whpx_vcpu;
 
-struct whpx_vcpu {
+struct AccelvCPUState {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
-- 
2.26.2


