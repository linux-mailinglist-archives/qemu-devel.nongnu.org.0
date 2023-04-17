Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A76E47C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:31:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poO09-0008TI-JA; Mon, 17 Apr 2023 08:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO07-0008T1-0o
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:30:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO05-0005rQ-BG
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:30:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso19733194wmq.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681734627; x=1684326627;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sOoY5WTG+InyofH4KHUoATfgAaPfNyAeXdK/e766al0=;
 b=f8522ysrl1IfSEB7/siDCOfEDKk/w/Do6Pgobux024FweSGC0QGYT10SBjf1VPso14
 utEY3jq0+lwGGGGvyw55J5wcn+t/pJu3jNlxravd31EZKNoPv7htBNkOECKCynWT+jHK
 xYjLRgI9Zx1zpxWbFB1HBwMH5bhPZNchVD3zVA7ADjuDHuxsumT1/czYS0eOktteISoN
 dl+Pap8Ihk9qzhrQ93ZrFA8NDYnTlGzfM2GAqnrSk6HPkT3NxdmyUGME2LhLbv6DZg9w
 nhHSrclBAjVRkd7ceyoXfa34gJHoABQ2gQ3EgvIL4UyDDh/NWJDCPg4F3AC6+DzsCN9Y
 mY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734627; x=1684326627;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOoY5WTG+InyofH4KHUoATfgAaPfNyAeXdK/e766al0=;
 b=R9nx+r+GNHxq+31URqCrzELsOjPg4fWjFocbZSjCieVm/q7Qbmy9QUPk5H+cDiZ46C
 lj0mxa4hww6yXGCXcio7F63N24QJoT6/SLRKGS4MO6/wmFTVXLEBv2pu24FqFhaxiEzf
 Nq0GMJtnval7FwUjBxWqrK6aNhzxfw1JK0lCvUgZKL70oswd8bTL9PyOs/wIW2uwboM4
 O48aG/UYu5BXSsoHJxrp+aho/PBnKSk/NAHkU3Q5LiAEcf9kyaV5j6TsbsO5s4e4L3wA
 qEebpH4GGdB+gXR9K9CzJgIDePYs9cASJqhu7H7MB4uBXfrYu3IsThVtnNGPtCP3+i9x
 m/SQ==
X-Gm-Message-State: AAQBX9ctklvKTQEusDlWqy7g3vgktfqfYwwxQFsv2BUvNSkFj3Px0DhA
 eiOF0tfXlD3uKeC6N+PYE4M=
X-Google-Smtp-Source: AKy350ZCWY+iLGD9Fyd2GzYGRLSxota9WngBMMlDXO/QahTk7nhjmJvBA6V5jWeqLAnMpj4K2y9GTA==
X-Received: by 2002:a1c:e90d:0:b0:3eb:42fa:39d5 with SMTP id
 q13-20020a1ce90d000000b003eb42fa39d5mr10451882wmc.29.1681734627479; 
 Mon, 17 Apr 2023 05:30:27 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b003f173a2b2f6sm2802937wms.12.2023.04.17.05.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:30:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <79aefe17-be48-2be9-7c3e-12056f5f2819@xen.org>
Date: Mon, 17 Apr 2023 13:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] xen: Drop support for Xen versions below 4.7.1
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In restructuring to allow for internal emulation of Xen functionality,
> I broke compatibility for Xen 4.6 and earlier. Fix this by explicitly
> removing support for anything older than 4.7.1, which is also ancient
> but it does still build, and the compatibility support for it is fairly
> unintrusive.
> 
> Fixes: 15e283c5b684 ("hw/xen: Add foreignmem operations to allow redirection to internal emulation")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-operations.c     |  57 +------------------
>   include/hw/xen/xen_native.h | 107 +-----------------------------------
>   meson.build                 |   5 +-
>   scripts/xen-detect.c        |  60 --------------------
>   4 files changed, 3 insertions(+), 226 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


