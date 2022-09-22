Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0E5E5C6B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 09:29:53 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obGee-0000IN-5M
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 03:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obGbY-0007BV-DV
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obGbU-0008O5-N0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663831593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvyOWmFuoJpedb1eywvf8x8W29MWS65UvdoTpcUXswA=;
 b=E7go3udbybcTxvwuqVKfqZy6KWZTeM9PAfNoCNmCI86BVHw1j88idyiiJzKk688vzLx49K
 2Rr9rvn9yu5ou8Qq/fzpEdjT1/+otwhPXptnTRYW1orGat9LTv9xM5QuQ4dK+eTd5ZXXXY
 1vm2VLzVmiGOYkbNJC6nIF5RPMwNDqM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-T5CCvoqhOFSuFLLTF3BMEA-1; Thu, 22 Sep 2022 03:26:32 -0400
X-MC-Unique: T5CCvoqhOFSuFLLTF3BMEA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so6011258edd.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 00:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pvyOWmFuoJpedb1eywvf8x8W29MWS65UvdoTpcUXswA=;
 b=5UK5rUpQ7MYyLvXSh1qA55CiAASHfFjamo/pibXBEA+zA0Bq/UxrPhSe8FxtqxF89G
 e/KOyDuqmf6j28kZp0LA/Blg07N2oId2RgX9TV/+nDhfl5rSLMhgzxHrG/iFjdH0iBaV
 /LqQwnNNBV+FA9X/Tu92rTXwYcH5JGvUO7aEh3RgVXjbhTPRA5hNUuOH0F9qnxwrKMG/
 /1WEbdXqqIZ9PHdUvRPHMOXHgEce+K3d7yYyahMg8cPW9BH1Vi76g7h8Ui0yIPptpDZj
 XauIQHblkZLqVPok9tYJmklLp2rEhhsupa5VYpTDmIgOZmAFARApzwZTHYvdUfSQzzqx
 goFQ==
X-Gm-Message-State: ACrzQf0l+YfC6ZdsqJiTT0kslDMhAFZKM4Di6BFeM9r2+opOCqPg+hoE
 gg+TCc+GwsFWLV1rFBvOsK00QtQsoUEK8+wd+MNMeCgeoLqD+GtYPYnSi+TcPYtFPoUuRMdqK00
 Pd6FJX9OHjMD5tLRqgRjBzhqLhKP+061AvLC+rWZiJ5BEpSe2zhF5mHqMhAlJ1YakwqY=
X-Received: by 2002:a17:907:6ea3:b0:77c:4e23:9b2d with SMTP id
 sh35-20020a1709076ea300b0077c4e239b2dmr1642303ejc.6.1663831590969; 
 Thu, 22 Sep 2022 00:26:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Omd9rfPXvnDPflpMieaeBAif7RC3z7EuWBGBQiVMviZOZTSz/Q5KQLBh3gr0q5GaxNvcX5A==
X-Received: by 2002:a17:907:6ea3:b0:77c:4e23:9b2d with SMTP id
 sh35-20020a1709076ea300b0077c4e239b2dmr1642280ejc.6.1663831590616; 
 Thu, 22 Sep 2022 00:26:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t17-20020aa7db11000000b00453a49ea65bsm3100052eds.86.2022.09.22.00.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 00:26:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v5 1/4] x86: return modified setup_data only if read as
 memory, not as file
Date: Thu, 22 Sep 2022 09:26:28 +0200
Message-Id: <166383158063.107920.1563965268305325639.b4-ty@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921093134.2936487-1-Jason@zx2c4.com>
References: <20220921093134.2936487-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Sep 2022 11:31:31 +0200, Jason A. Donenfeld wrote:
> If setup_data is being read into a specific memory location, then
> generally the setup_data address parameter is read first, so that the
> caller knows where to read it into. In that case, we should return
> setup_data containing the absolute addresses that are hard coded and
> determined a priori. This is the case when kernels are loaded by BIOS,
> for example. In contrast, when setup_data is read as a file, then we
> shouldn't modify setup_data, since the absolute address will be wrong by
> definition. This is the case when OVMF loads the image.
> 
> [...]

Applied, thanks!

[1/4] x86: return modified setup_data only if read as memory, not as file
      commit: 7e660efb4d2af17582588bcdc4af7d28040feda6
[2/4] x86: use typedef for SetupData struct
      commit: 1127a29a33f975943d89fc36ab934ad37810e4b7
[3/4] x86: reinitialize RNG seed on system reboot
      commit: e997fc36def502dc3e9da915816083f086dff8f2
[4/4] x86: re-enable rng seeding via SetupData
      commit: a731bae726f2b3168dea9d5137cb7e47444448eb

Best regards,
-- 
Paolo Bonzini <pbonzini@redhat.com>


