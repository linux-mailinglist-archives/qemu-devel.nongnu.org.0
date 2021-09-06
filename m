Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022640168D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 08:49:58 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN8S5-0004Br-56
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 02:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mN8Qw-0003W0-Ka
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:48:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mN8Qv-0006n8-5O
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:48:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4147027wmb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 23:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2q96vSBWYolsynVYZ8qCx75g4juhICH/4ouPIjinkI=;
 b=Jyyedaj9+sm7NqUcI1nGPWdF9/qLNUsEdhKM2iNOsLkMAEpsa+1DRaYXva8ydqaQ2K
 EbfPLuPpu9rGlxyst45Fa9sTFZ/sR+wMAu0S5CghrRIPSz2lgf0B/qCkEbRf5i4mzviw
 c7lAAd9Le+RXQn96K0SUv8C5x/ACANaaqjqJunVOleHN4LheJOhKvA9Ndew/VzZ3010T
 1bxbCL9e3dI9pVDJFzd/W8H6VhrQCssi6Fp1HiYxjwUycMmgE5fP1Hw4qCSQR6oySAgu
 TGQTohXJCy331cXN8h6t+jGsBJwTWweeV/oF2scVLMYYNWGpK+GNzJEHKPjDrQByIboF
 GA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=d2q96vSBWYolsynVYZ8qCx75g4juhICH/4ouPIjinkI=;
 b=XHqUhEBON2uU+A+0ttzu3SI/1payObWG+nKnDImpDlOX/SoLmVcn9bjY7BPXY1kwKZ
 T/6kMsgEsC/9M68y68LLq531X8RMP/RZVtPkCrx0MKb47vEMPaQkgvmmHaxsg2XJlP+y
 p0i3R9aCzmDHKt4Z4AQhmW6+yybKExKR524/4QZKxgO6FXA0qCn7AdE7FAZ1kbBI+OV6
 jU/YZwy2NRByA/qrMgUUf52MWJdSmQKDJqhu1k7x4W6t47rYQ5UyZGBfI+BPh+z64dSH
 k1mLYDyiY3NOC+EUM3/5LvPHOh+D4SfhgXL5W5aJCg1lOkQ0R8OJ2ry1Y3LCnvW4XRck
 STsQ==
X-Gm-Message-State: AOAM530t99omvqzARQACaV4HqOdn2To6WgndNY4Ml9lY9k3ROlpTJ5MT
 U/2rYGXzyATSspRhdBTlA2c=
X-Google-Smtp-Source: ABdhPJz5GXTy42bFINdV+bVQ/4IrI84/Mcf+IJ/fqGcFF/rg1XE+6IOHLmrnlMvlR77t4cVIc38DfA==
X-Received: by 2002:a1c:cc13:: with SMTP id h19mr9722348wmb.187.1630910922999; 
 Sun, 05 Sep 2021 23:48:42 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:f581:5504:73aa:6d39?
 ([2a00:23c5:5785:9a01:f581:5504:73aa:6d39])
 by smtp.gmail.com with ESMTPSA id k16sm6930834wrh.24.2021.09.05.23.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 23:48:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 30/30] accel: Add missing AccelOpsClass::has_work() and
 drop SysemuCPUOps one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181943.763360-1-f4bug@amsat.org>
Message-ID: <f039f2e5-2558-2305-c30f-aaa89084e3fd@xen.org>
Date: Mon, 6 Sep 2021 07:48:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181943.763360-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 19:19, Philippe Mathieu-Daudé wrote:
> cpu_common_has_work() is the default has_work() implementation
> and returns 'false'.
> 
> Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
> and remove cpu_common_has_work().
> 
> Since there are no more implementations of SysemuCPUOps::has_work,
> remove it along with the assertion in cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>

