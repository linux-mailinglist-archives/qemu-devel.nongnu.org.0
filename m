Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D10376735
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:48:30 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1mH-0001kS-OW
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hY-0007YA-94
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hU-0000aG-KM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWe+dxIQxlwOjXTVq4nmSO21Ag5LIQeGVfXOgPjRmt8=;
 b=ZaB6gKevzPVzKBe3fJgPItBVYmUHv/bwN0gfdmm0dfg3tRtRd/R1l1o9zO3oT88Uy2AMvE
 ZwUNW4L9mhpu6QkIWk0o7qcUf63+fo3ZjHtuOGU4r3FFOZKzmjrI9XvOA8iN/fYZToI9EO
 /Pl48VEDcNb0G5bhepCWg7Scn6UTGBc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-LfkmTJtnNaWIuXSdolMoCw-1; Fri, 07 May 2021 10:43:29 -0400
X-MC-Unique: LfkmTJtnNaWIuXSdolMoCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3695189wre.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWe+dxIQxlwOjXTVq4nmSO21Ag5LIQeGVfXOgPjRmt8=;
 b=uBMdc1sg+cIIy9gpi6xFReb8tZAZKOXUb1OoFjXpVSPpirYAWSvSh+foSX/N0aUkvh
 pCpwrNMuDLwSdVC6VDSihFCRRoqnZLZiVPkyEIfdG8SCLODcuGIKtROWJlBMqwD3Aqof
 Q18xYFvOSt9eexyOG9ly1LuFji3cIK2BLIks+5qmTzRQi2zXVo/zbMGip/BhvHY+tWN9
 AlYGZ3xWuM0AeOD48pL+GKqVEa8JYyYVdQ3v1dMOwSfeg/W00TEGcBQ6V2mwkJ4GsbZa
 yZA8+h1XFAtqJ1b+ELjphtr19QjiuaBrSeArCyVGRUuDWMst+YEsosOe0CmlyVti/QRL
 XC8g==
X-Gm-Message-State: AOAM531s6v5eHWH52zNhHMlLmj45SZs9FFP8rYXc0Xkx2YfpfLTlSmqO
 NxZccuSc8gQxGAwQCbaHxeQR+zS0k8bzuZAJ0kKaDq/+hJEaMTgak/atiy7S1/xFz09bsNQxbTv
 t9S+mCHUZ8vpGgWOKEfGzd3i5WFGfaevMLqft/06MjnWEXFl/4Iu0oe5efunjvcK7
X-Received: by 2002:a05:600c:293:: with SMTP id
 19mr10481696wmk.144.1620398607383; 
 Fri, 07 May 2021 07:43:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzJXjh5EIUZ5UvBdcTDtVAODkhggy3oiheKgCV4ZKOSMg1GrJfTFeIVPOdUMHt/oXW6+6GrQ==
X-Received: by 2002:a05:600c:293:: with SMTP id
 19mr10481664wmk.144.1620398607116; 
 Fri, 07 May 2021 07:43:27 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id o15sm8521863wru.42.2021.05.07.07.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/17] linux-user/elfload: Replace alloca() by
 g_try_malloc()
Date: Fri,  7 May 2021 16:43:00 +0200
Message-Id: <20210507144315.1994337-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/elfload.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fde..dad2dac24a4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2591,6 +2591,7 @@ static void load_elf_image(const char *image_name, int image_fd,
 {
     struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
+    g_autofree void *phdr_alloc = NULL;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
     int i, retval, prot_exec;
     Error *err = NULL;
@@ -2610,7 +2611,12 @@ static void load_elf_image(const char *image_name, int image_fd,
     if (ehdr->e_phoff + i <= BPRM_BUF_SIZE) {
         phdr = (struct elf_phdr *)(bprm_buf + ehdr->e_phoff);
     } else {
-        phdr = (struct elf_phdr *) alloca(i);
+        phdr_alloc = g_try_malloc(i);
+        if (!phdr_alloc) {
+            error_setg(&err, "Not enough memory to load ELF program header");
+            goto exit_errmsg;
+        }
+        phdr = (struct elf_phdr *) phdr_alloc;
         retval = pread(image_fd, phdr, i, ehdr->e_phoff);
         if (retval != i) {
             goto exit_read;
@@ -2979,15 +2985,15 @@ static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
 {
     int i, shnum, nsyms, sym_idx = 0, str_idx = 0;
     uint64_t segsz;
-    struct elf_shdr *shdr;
+    g_autofree struct elf_shdr *shdr;
     char *strings = NULL;
     struct syminfo *s = NULL;
     struct elf_sym *new_syms, *syms = NULL;
 
     shnum = hdr->e_shnum;
     i = shnum * sizeof(struct elf_shdr);
-    shdr = (struct elf_shdr *)alloca(i);
-    if (pread(fd, shdr, i, hdr->e_shoff) != i) {
+    shdr = (struct elf_shdr *)g_try_malloc(i);
+    if (shdr == NULL || pread(fd, shdr, i, hdr->e_shoff) != i) {
         return;
     }
 
-- 
2.26.3


