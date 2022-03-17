Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C544DC61E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:48:15 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpY7-0002t5-17
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:48:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpUT-0001OM-IA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:44:29 -0400
Received: from [2607:f8b0:4864:20::102f] (port=35804
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpUR-0000IH-VL
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:44:29 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso7461631pjb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JoLVqatoU818GPi2d9XRBwgOcpEr56C4oGDuhjgZa8s=;
 b=DqlVF6G6dq5sx8ZVifXc0Vtn4kE6P5/9LGsP5vwe/ecmeqAvXaGLVegf4ugiybsNsG
 gDpQVMc5ShupCqAJURIQ2Wvzpccqk/aXsEtrd2pbEUjbL/gmU5enO/EAlS63dLGxibNj
 HwYzmdXVxV4UkGjt4BJy7bFy9jnPZomU75K4XwuFRaHdyue8g1/FSVoNkrmQauIqq1P8
 Tw/chlMYPgLDN/h1THm3DUWVB3gbqvMhBDs95G5zvOC28wes5nLXlQVkCCARy8oPfEiK
 vWPZulkTV2LlceRLPCtcibKV54IYA8h/GhGHeOWVtJvyyI+oavR7IbXtsEEKUl4G5Wzl
 hISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JoLVqatoU818GPi2d9XRBwgOcpEr56C4oGDuhjgZa8s=;
 b=H2A1JmjAE2bNCHe3GR/h9ShgfKxpJsvNuGkH0Tg3lasTwgB8C3o2XIMkjT/TeUtwI2
 FNa4Kg8bX8Z/GLCXuPK5nMki5qutOw2+QPCXSY/g9GYY5n7+zkUfjcGgXBKM5Xyf0iOd
 s/oeYf4ksSydRzD2zcbol8fvN1Eea1vruJ88yIJF1dxuJITUF4SK32dg4CZhxTCrdRxd
 kyHU9aMPWmO4I8ka2qEoWqLdHkO0NVkqzoHPyRXRVLo1dz6aJ2f7NAywlzazFZIxLzmE
 +6IZy8cI58RgZuQ3+NVoHWeboeytjhhBBaHzZ0DFQ+5xFm5WKFR8CZZenf6b071/VtEB
 +CYg==
X-Gm-Message-State: AOAM532qAypGAYXvB9AS7tGQ1g66wrBJO1o4Tlg38dipNUuXNqaLW7/s
 jHrtsH2ANKi3QBcKA9iapIs=
X-Google-Smtp-Source: ABdhPJziZnzO1R//K5UceOSQWR1kb62gR/e2uaHtbZEgCnQCNQRUaOEHGra9rbT24YF8Bov3UPhonQ==
X-Received: by 2002:a17:902:7fc1:b0:150:1ae7:94c5 with SMTP id
 t1-20020a1709027fc100b001501ae794c5mr4841306plb.45.1647521066152; 
 Thu, 17 Mar 2022 05:44:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a056a000cc900b004f7a986fc78sm7184724pfv.11.2022.03.17.05.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:44:25 -0700 (PDT)
Message-ID: <467e6527-add6-f68c-1237-9de129548522@gmail.com>
Date: Thu, 17 Mar 2022 13:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
 <2f4d8e8f-163a-d6d5-1a06-3a47f8969026@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <2f4d8e8f-163a-d6d5-1a06-3a47f8969026@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 12:57, Paolo Bonzini wrote:
> Just one change to aid future reading of the code, possibly.  Move this 
> line:
> 
> On 3/16/22 17:03, Philippe Mathieu-Daudé wrote:
>> +    qemu_event_init(&cbevent, false);
> 
> just before
> 
> +    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
> 
> i.e. the place where it was before the patch, in cocoa_display_init.

OK. I'll also include this change
(s/cocoa_display_init/applicationDidFinishLaunching):

@@ -611,17 +611,17 @@
  - (void) updateUIInfo
  {
      if (!allow_events) {
          /*
           * Don't try to tell QEMU about UI information in the application
           * startup phase -- we haven't yet registered dcl with the QEMU UI
           * layer, and also trying to take the iothread lock would 
deadlock.
-         * When cocoa_display_init() does register the dcl, the UI layer
-         * will call cocoa_switch(), which will call updateUIInfo, so
-         * we don't lose any information here.
+         * When applicationDidFinishLaunching() does register the dcl, the
+         * UI layer will call cocoa_switch(), which will call updateUIInfo,
+         * so we don't lose any information here.
           */
          return;
      }

