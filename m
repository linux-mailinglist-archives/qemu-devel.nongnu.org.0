Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273454B303E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:18:00 +0100 (CET)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeEo-0006pw-Pb
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeB5-0004f6-9d
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:07 -0500
Received: from [2607:f8b0:4864:20::1034] (port=32887
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeB3-0002fg-Be
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:07 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso5088784pjh.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=npGtPiDlXmJsq6y1SkJVyO5bpwger/kteStxrmIhx0c=;
 b=Dfo8LfYQFjpeu/dmMYKWrp9RDRRz0s9UdhW8Hl12PPI0jPnVhw9UuaPklVY/q7omIY
 e6JxXYUgSbGwWI3GNuujj5fbYdMNbWwoSJPihJKPnxG16tUKBJII8PoSKQTTcdFqSCZ5
 HJhsW3GR/DxCeRD3KjTycPufOjldP9FAt33xnvTv7Q+KWnIXJneRPar/Hb26t31SNNRg
 Fyk3Pc798YAj14VHExwcjzhlJnjGu4sKgsgwkxAd1rn5kFmez4+vf1wQRJf7ZLGrx0x3
 kB0iJTHcCUCQHXTs2rXWTGw+ypBuU9aA1E3TXam66GaFr3xprrVGpo20Xq3AS7RnEy7t
 2mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npGtPiDlXmJsq6y1SkJVyO5bpwger/kteStxrmIhx0c=;
 b=p7Q7apcSWU82IOoXSqULFbiz5g8jeZrrtvjt4L0TEniBT/4vwtW039PtnGBZwgjmB/
 jxL/gh57hHsuU2ByvS8mk9iNffsszKsUE24Cyo9iA24rToqUSCAuoQ0XzT6M8wdHpk/R
 o2kEUgvMl1znbete8pdHjzwrSLSMJqCcF4Jp3HjSkbGOI6GaERnGuGHq56Fol5f9FEGf
 q97+gkISqSP6RmS61FdMlYePy1XqvdxrDmOGCJddTBnetvulYItDhTGKusQ/KoNyyKzj
 /i9gg0THH0UjjsaftZF85EjaTuOLioTfXEa68PnpjHwIEoYPL053kAG1vizz9XGd8aoP
 9erw==
X-Gm-Message-State: AOAM531y98NQA6CInbm53Ila/WyUYCZIUO4Nozwd2H2udsdofMbkT/5K
 v99tXeTLbZaeFzoDCK4fSF8=
X-Google-Smtp-Source: ABdhPJxpm421cOwFb3wIY1QOtqcIclZMbATdBpOpBmUHnxWtTuwN14mSo5iDEq0Pb4MtF+HlEfX8UQ==
X-Received: by 2002:a17:902:e94e:: with SMTP id
 b14mr3600319pll.114.1644617634936; 
 Fri, 11 Feb 2022 14:13:54 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:13:54 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH v2 00/25] Virtio Sound card Implementation
Date: Sat, 12 Feb 2022 03:42:54 +0530
Message-Id: <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second RFC for implementing the VirtIO Sound card as described in
the virtio specs. Sorry for the absence of activity on this.

The output from the sound card works.

What remains to be done:
- Features defined in PCM features. (Eg message polling)
- Channel maps
- Jack remaps
- Input

I will work on the input after I have implemented the output
along with all the features since at that point it should just be a
matter of reversing a few things in the code that writes the audio.

I can work on this patchset mostly on weekends now but I will try to be
more regular with this.

Reviews are welcome :)

Shreyansh Chouhan (25):
  virtio-snd: Add virtio sound header file
  virtio-snd: Add jack control structures
  virtio-snd: Add PCM control structures
  virtio-snd: Add chmap control structures
  virtio-snd: Add device implementation structures
  virtio-snd: Add PCI wrapper code for VirtIOSound
  virtio-snd: Add properties for class init
  virtio-snd: Add code for get config function
  virtio-snd: Add code for the realize function
  virtio-snd: Add macros for logging
  virtio-snd: Add control virtqueue handler
  virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
  virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP handler
  virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
  virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
  virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
  virtio-snd: Add default configs to realize fn
  virtio-snd: Add callback for SWVoiceOut
  virtio-snd: Add start/stop handler
  virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
  virtio-snd: Replaced goto with if else
  virtio-snd: Add code to device unrealize function
  virtio-snd: Add xfer handler
  virtio-snd: Add event vq and a handler stub
  virtio-snd: Replaced AUD_log with tracepoints

 hw/audio/Kconfig               |    5 +
 hw/audio/meson.build           |    1 +
 hw/audio/trace-events          |   14 +
 hw/audio/virtio-snd.c          | 1241 ++++++++++++++++++++++++++++++++
 hw/virtio/meson.build          |    1 +
 hw/virtio/virtio-snd-pci.c     |   72 ++
 include/hw/virtio/virtio-snd.h |  383 ++++++++++
 7 files changed, 1717 insertions(+)
 create mode 100644 hw/audio/virtio-snd.c
 create mode 100644 hw/virtio/virtio-snd-pci.c
 create mode 100644 include/hw/virtio/virtio-snd.h

-- 
2.31.1


