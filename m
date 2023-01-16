Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940366CE2F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 19:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTn0-0005Nh-55; Mon, 16 Jan 2023 13:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTmr-0005LF-A3
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 13:00:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTmn-0001M7-Gx
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 13:00:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id g10so20579340wmo.1
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hdcHU1ginwC/Dhq6oKowArWhf7zZVDw3J1wvHb3MmEs=;
 b=QGUh4QxKNJs94fEHP9j7u8UEPG8RwGMe3lqrO1iHm0e4GBRyvxSS65YHIBFfj3496z
 52JlNISBfpXhuTtkNVamDrFnit9Ul+o8C1BuvmfUxvObu2WyWYjA+6jO0AuTIYKa2XY4
 F5KkQEdEYf0CR6E9XX2ayorYefAU3DooGT1xuCuXp3KyKklCoBh0SSj+GDxxhhb0iAnC
 O+ZQUZSroHexg5YNJ2a20Yd7NUbuvzp8LEbuoLAkWFCNL5KFy1XuRhrIK+zVLlvEPIWZ
 9rqYXdISrlgfHwBcgSU9Wj8X7ga5wEFH9d+quQjPHCnEm0o4qfWDPzz5vnYPkjZPpDJa
 o3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdcHU1ginwC/Dhq6oKowArWhf7zZVDw3J1wvHb3MmEs=;
 b=tY9mPXuJSXPsBMpjG8J1Gp22MhBtCE0iTRHbty/AnF2KCNs5XpU6CG6BUTIq0/JfB0
 +Rj7C1f5KlJBq+hPmALw1+IxNhGFA7lMXb1rUJ6dkVBvi33I/AtQf6nkYfcsWUfkUasq
 m1KP0MvlwrHaM0YMU0bvjBgNOdausXynLbp1XtBP5yGZxUOj9g1r2ZnsCFs5F0iYwJXe
 6j8iF4umIijfWAhUvs8ODF7DODJvLmiesvJhcQSos+N5TL5tcgIuqtufOs+kPjkwS8kI
 wsOFwLU1U43ivs1mlXjIGiUq16apWVuDiM/bpP8MfoD9iX5OCZVZZtgL9TFWNqOndpY+
 Q7Cw==
X-Gm-Message-State: AFqh2kpLfRHe7QcyQLljZpFAgXd/ZE29ZfQ2U27scYYdCQ06PQqczAPW
 8kV4QNXIkMz04wlOdZ26+KA=
X-Google-Smtp-Source: AMrXdXsagKBB+kRoFfa+gd0ZYhIiT5Z7965IR+PsSmpjE2WQNxRZgPmySahrvz1SFCwpKT6xZeqLKQ==
X-Received: by 2002:a05:600c:3582:b0:3d9:ed39:8999 with SMTP id
 p2-20020a05600c358200b003d9ed398999mr298501wmq.35.1673892040146; 
 Mon, 16 Jan 2023 10:00:40 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a5d50d0000000b002755e301eeasm9097300wrt.100.2023.01.16.10.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 10:00:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2233c63a-b943-99a0-e1ae-6f5381730fba@xen.org>
Date: Mon, 16 Jan 2023 18:00:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 25/51] i386/xen: implement HVMOP_set_param
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-26-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Ankur Arora <ankur.a.arora@oracle.com>
> 
> This is the hook for adding the HVM_PARAM_CALLBACK_IRQ parameter in a
> subsequent commit.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Split out from another commit]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>


