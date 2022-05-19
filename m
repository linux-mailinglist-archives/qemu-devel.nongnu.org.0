Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E452D0AA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:38:40 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdY5-0005Sz-3l
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrdWU-0004eP-OH
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:36:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrdWT-0001oj-0r
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:36:50 -0400
Received: by mail-pg1-x532.google.com with SMTP id q76so4670514pgq.10
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=ZkHJvjiogV8uoLrlAZ3zbuSKzMUvbf6MMvQLCE34nA4=;
 b=hlAbwjhXBD9LjlLlypcKZZoflJNG82pFK9HyOqHKFVP8OJA/sglQcS7vssjcxfKRX4
 jRIZw6EUnFG9By/nWqAnTJbQo5zuYGGfm7p/G6hTrssU8EjKBhg48LEzpwa9RZOFyCEB
 zyhDhn27K/QsZkR5/9CpEJCNLtP54WCmGo0qpD6PVJdTjBPUk86/6oB9/6G2GSdJtANE
 w/D3BoE8vahxZA8LBBujEEzRNttgHvClTv805aqD1OH1zxsFm5INYSeBmCXwQs9nxvzo
 vl/TJD1kQQMEtiBkbH+K9rIybxtFJn2+vz8CX7L8Sabh/xoKyMeHUNdKHC1Qb/5l/XYl
 egZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=ZkHJvjiogV8uoLrlAZ3zbuSKzMUvbf6MMvQLCE34nA4=;
 b=KAxbVjp9r2bu38W9kCp4rX2/mkBH7GJRXDRgXhwKEDNAdEN/2nPRj6KcRmEo23tcLF
 GupEHz1IiGu372JpRy2fnCkCdvQgr1suagQhcnIuboZkntaOVBbgoacUNj75vBFPzz5z
 fFVlObsHcoTED4m2TnGeFouFnbTl/gL9jUoJaclLdphbdAgVWykJ6/mHZXNxVvd/ff5q
 gLJxv8fq42DGWnuBcbkzoF+kz1uuZAwd5cfdn50gP811qSSy7fgBlo/ERBenk+SytMS0
 9pRswTETzHEx6dM+IRz+6sfYbGLm/Y48mpvv6t6WjcJ+z/2TpYKkyz3mj+hliwGVMU8J
 CbVA==
X-Gm-Message-State: AOAM533MZxywMRPqbFmQLNBXXGwO7dd8qnIkB9Ruog2fEn3BmWT6vTpa
 wx3fnbtugvV3PWnol4yRCZ0Nnw==
X-Google-Smtp-Source: ABdhPJxH9QvTXKLFh7rwfaNFUgSd8txsly6B2HhhmOq9lX9BNXeil8yJq753Y3v6eY2rkhSzyhR5kg==
X-Received: by 2002:a05:6a00:3023:b0:518:4721:13c6 with SMTP id
 ay35-20020a056a00302300b00518472113c6mr795216pfb.34.1652956607066; 
 Thu, 19 May 2022 03:36:47 -0700 (PDT)
Received: from anisinha-lenovo ([49.207.223.153])
 by smtp.googlemail.com with ESMTPSA id
 n22-20020a056a0007d600b0050dc7628139sm3980069pfu.19.2022.05.19.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 03:36:46 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 May 2022 16:06:41 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Josh Triplett <josh@joshtriplett.org>
cc: Igor Mammedov <imammedo@redhat.com>, Qemu devel <qemu-devel@nongnu.org>
Subject: bios bits for QEMU acpi tests
Message-ID: <alpine.DEB.2.22.394.2205191553440.3608174@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Josh:
I am looking into integrating bios bits into Qemu functional tests for
acpi. Towards that end, I am trying to compile the code on a newer
compiler as we might need to make some changes, for example, update acpica
so that it can recognize newer tables etc.

gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0


Since grub/python etc are quite old in the tree, on the newer copiler it
does not build out of the box (it does however build fine on my centos 7.9
vm with gcc version 4.8.5 20150623 (Red Hat 4.8.5-44)).

I have resolved a number of issues and warnings when compiling it on the
new version of gcc. I will at some point clean then up and share the
changes through my github (most are cosmetic). However, there is one last
issue which I am not
able to get past:

_GLOBAL_OFFSET_TABLE_ in python is not defined

$ nm -g -P -p --undefined build/grub-build-i386-pc/grub-core/python.module
| grep -i global
_GLOBAL_OFFSET_TABLE_ U

I have made the following change in rc/python/Makefile.core.def but with
no help:


--- a/rc/python/Makefile.core.def
+++ b/rc/python/Makefile.core.def
@@ -29,7 +29,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 module = {
         name = python;
         cppflags = '-I$(top_srcdir)/contrib/python -I$(srcdir)/contrib-deps/python/Include -D_IEEE_LIBM -D__LITTLE_ENDIAN= -I$(srcdir)/contrib-deps/fdlibm $(CONTRIB_CPPFLAGS) -include contrib/acpica/acenv.h -DGRUB2 -DACPI_LIBRARY -I$(top_srcdir)/contrib/acpica -I$(srcdir)/contrib-deps/acpica/source/include -U__ELF__ -I$(srcdir)/contrib-deps/libffi/include -I$(srcdir)/contrib-deps/libffi/src/x86 -I$(srcdir)/contrib-deps/python/Modules/zlib';
-        cflags = '$(CONTRIB_CFLAGS) -fshort-wchar -maccumulate-outgoing-args -Wno-empty-body -Wno-float-equal -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-missing-declarations -Wno-missing-format-attribute -Wno-missing-noreturn -Wno-missing-prototypes -Wno-nested-externs -Wno-old-style-definition -Wno-parentheses -Wno-redundant-decls -Wno-sign-compare -Wno-shadow -Wno-shift-negative-value -Wno-type-limits -Wno-undef -Wno-uninitialized -Wno-unused -Wno-unused-parameter -Wno-unused-value -Wno-unused-variable -Wno-write-strings';
+        cflags = '$(CONTRIB_CFLAGS) -fshort-wchar -fno-pie -no-pie -maccumulate-outgoing-args -Wno-empty-body -Wno-float-equal -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-missing-declarations -Wno-missing-format-attribute -Wno-missing-noreturn -Wno-missing-prototypes -Wno-nested-externs -Wno-old-style-definition -Wno-parentheses -Wno-redundant-decls -Wno-sign-compare -Wno-shadow -Wno-shift-negative-value -Wno-type-limits -Wno-undef -Wno-uninitialized -Wno-unused -Wno-unused-parameter -Wno-unused-value -Wno-unused-variable -Wno-write-strings';
         enable = i386_pc;
         enable = i386_efi;


I have ensured that the cflags are infact getting used by gcc. I am not
sure how to resolve this.

Do you have any ideas?

Thanks,
ani


