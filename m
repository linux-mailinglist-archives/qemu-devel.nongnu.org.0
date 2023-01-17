Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C166D7D5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh72-0001gP-Ak; Tue, 17 Jan 2023 03:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh70-0001g2-MM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:14:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh6z-0001UX-66
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:14:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id j17so3057086wms.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XtGojbKzXUM7juf0AcEH3srb2ih/2RDW+7GS4A/8VtY=;
 b=JlxY+A+QQb0GVzd2YszP/0ZfIcqyhubsuibhhPfx0TQnai8ssfdgYJDvIu4UPSVSuz
 nFnuKP1y2vE7yZHBefJNsfvUYKrH3SRwhrUW+K/4wQ0BZgBWPpD7D405BTnz/uTKUbiX
 cvZ4Hge4033PlKNEwr92chLBjoq2e/cgDzgTjgA1ZaBILb8vOyZEWXVRyb3e3w2oInYg
 r8VPS1QhHN6NphesEkYboxGahVO6Z4YX83WNCyAPMlnnlGOI4GvYca43z8KmgTnij01I
 FH5z42GwHOBTD9EgGqaSrkhK5EMhcN73jELXpX6nE/yOQ66TQzeptTqJxxv/mINsIxld
 lGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtGojbKzXUM7juf0AcEH3srb2ih/2RDW+7GS4A/8VtY=;
 b=T9jjxZ/zcqoz1NKARSchy0xo1hT0kYIPEryRIU1rFek2OB9mPtB7iw8ec9X0/jtMcG
 oT6kPkpg7HGTqBLeW5nFg8kvUqCH1hIrZe+yvIkx/1DSNPbj7hBoCOVZJy/9/jx9c5o3
 28AYE1JLusNBvvW/elCn1F49YCI0oV8FpnrGAblcRqVrjUYf10cKtD294vJD3snvq72Z
 nSVoKnspXM3R+mCWkOKFo4tzCxRNRznIOJ12dS6VnjTrzAloeMaUvK4NvHA9xFEp+HH6
 fOje2DzVsWMukVsBbVgq4psYJFKjJ1mfGhjd0yppBaukCC5i4SKH3vcd7ezzG6+raizl
 KLrw==
X-Gm-Message-State: AFqh2krui01PARkN0fJ944St3AYo0hgE+ECAcZHewJxYsyy8Sr1v3bx3
 EXqxwr2CGxKpGQaWkHEnaAtEvw==
X-Google-Smtp-Source: AMrXdXvnGZuWea607ui5AOiRp5b02SrVuSv1xciuVrCYd67Bdmz6V87kWDfdzx9CqRWDS5TmozZH4Q==
X-Received: by 2002:a05:600c:1d87:b0:3da:fa8a:852a with SMTP id
 p7-20020a05600c1d8700b003dafa8a852amr6241201wms.4.1673943267601; 
 Tue, 17 Jan 2023 00:14:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm35245696wmb.45.2023.01.17.00.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:14:27 -0800 (PST)
Message-ID: <9cc08c17-b16e-0cbd-2a00-71db9be979bf@linaro.org>
Date: Tue, 17 Jan 2023 09:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] libqtest: split qtest_spawn_qemu function
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230117080745.43247-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 17/1/23 09:07, Paolo Bonzini wrote:
> In order to create a function that allows testing of invalid command
> lines, extract the parts of qtest_init_without_qmp_handshake that do
> not require any successful set up of sockets.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/libqtest.c | 103 ++++++++++++++++++++++-------------------
>   1 file changed, 55 insertions(+), 48 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


