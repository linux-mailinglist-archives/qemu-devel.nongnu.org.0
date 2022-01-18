Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E01492075
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:42:32 +0100 (CET)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9j8R-0002yd-0T
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9itj-0007ke-Rn
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:27:20 -0500
Received: from [2a00:1450:4864:20::32b] (port=46880
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9itd-00047D-QG
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:27:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so2527817wmb.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 23:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uNjyZmX5ESegAmIIExpBzBzyAVv1u6xiaK1e/eB5DOw=;
 b=Rwdvw2Dxbl3q+bA6p/GMLObKUUqtqq94WtfHKVXoAxEmZLZoICgUNK3F6LkS3nX5KP
 nAA7bXg+wWuyTq3PDe3DzNMlc2pRAtGIzkAstl9CEbggcbJQbN4LiQli1ttukVUfVK+v
 67ud32tAQDG6eP/5gbAYdj9aJm5kNr0SXmaU7CWO9NiNn29qnj1m8IbKDslIVEGVmAtP
 GKU9ZwOpwqNksLY6H00LUJ7qbR9uBXMP84bSos9FP1NN9IDD6mwBOtDbMorfvu94IuQd
 rWZ/j+sJIBYQIfAOLnyJl39px37gftDTMcXEMv2QWiBQzdT6Tbg2qZcjOS3zdtwUaA2t
 muWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uNjyZmX5ESegAmIIExpBzBzyAVv1u6xiaK1e/eB5DOw=;
 b=GXGpwALjvGwNCTcb3iwwjbAAt6hceKD7otQYlgvkhQF8f22XpBJG3cFxSmarq6tuxG
 Y+IXYfGQC+IrXbn7NxDXpxoWz2BGhvWyvISz/rOpnzQ5OcCYut8zedQqQLe5w6GKLVq3
 8dsenSykIlQicMmKJcB3h0UHyPl8bn3mLc7pwBtlJbcjJOHTfihRQ3sMCZrFJapzTP4e
 xzBa3Q3cyGul4U2OAqTafxvantSQp/pdmx3aAuBIbVTxFmxb7YlS/XpYwhqZDt/NJKGM
 NoEnqiXAc/YbcKziaYmYleiHj3hb56qUx8uN7NURcBWHhODkG8X4+f0tcQrMFUFOV0Mx
 23sA==
X-Gm-Message-State: AOAM533bat2DPPQtP5+mXOCPhjgx5ANC26iNLjJSndMmdtljlCg3Dr/X
 aU1fxw6whYn6xBeidnnRFIA=
X-Google-Smtp-Source: ABdhPJwetJGFS+Agbo0L62EUwudas/G0Y5CQmjzFxZSMxNqCiTQY0RZxjPy+tHY4MqrNqDknpIesMA==
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr886308wmm.44.1642490831727; 
 Mon, 17 Jan 2022 23:27:11 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e17sm15276777wrr.34.2022.01.17.23.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 23:27:11 -0800 (PST)
Message-ID: <153c941b-116f-1323-7078-bf8ddb3f9539@amsat.org>
Date: Tue, 18 Jan 2022 08:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 0/2] memory: Have 'info mtree' remove duplicated
 Address Space information
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210904231101.1071929-1-philmd@redhat.com>
In-Reply-To: <20210904231101.1071929-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/21 01:10, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (2):
>   memory: Split mtree_info() as mtree_info_flatview() + mtree_info_as()
>   memory: Have 'info mtree' remove duplicated Address Space information

Queued via memory-api.

