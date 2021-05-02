Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF51370D9F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:18:30 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDrZ-0000S9-Ps
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldDdt-00049j-Ka
 for qemu-devel@nongnu.org; Sun, 02 May 2021 11:04:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldDds-0007uR-1D
 for qemu-devel@nongnu.org; Sun, 02 May 2021 11:04:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id n205so964359wmf.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IO7Fte9k87dVMgXNBKQJsa5eoMJ1OKGdffJW+6wTWfs=;
 b=bUzAXa476LchSS/7FSenO6kgpuRVu7uv5fMSFVLN2vOn047XuLGzA/g2SVhJ5nfGb5
 o2aUSs4joKTO+8r7reCZC6D9ct2EGovqCJkqYwKhR2h/JlUbRpHJM+6nE+hiNom7tQaz
 YN0AKzKMNiHdhx2fXVM0DIR0sNo/RAqig8VCcJOLKnQcgf8UsLJGVNIpUvwft3+4xOwm
 GFr78YbPFwSNxINh3Y1wAMx09OfbODk6+6z85nReOmJ+KkhoG4TtQceQhfdNpekHogQ5
 HuxEj//vOb7pZKOSbFeF4YuuuJKVJTQN0/pyTRTxHQERBwO1Uk4PbxHzxcpPEJj58aX5
 fmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IO7Fte9k87dVMgXNBKQJsa5eoMJ1OKGdffJW+6wTWfs=;
 b=FpRNJaWPhKkNNVl3ZT/uNp39zHG9KX25kdslC+uJetS0vs6MNOpDRWQZnKuckjmCBP
 zKVnCmH1Tx3VvgWhMYpn07IeXVeo4H/1+atzWdo4JyobGc6IQ7SURhg75UJVm1zTu3+2
 ichzjT4Yx+QQsuoG3AlJE6TpZm5PM5ePiz90S384vWq7V/vjm9NcW01n/Lv2S6eVXiaX
 hFNZqaz+4k6vCTtDafdv0rXLEO6BYfQhlGvTup1R5YmEbugf0IldWFcrB6lamRzIF9NI
 o0X3kX51g+Qjb5OUmw+pIbhDr14nvIvAje8MPgqFpQ1VDgK2QAW69SyytGlPdVd+McTD
 my2w==
X-Gm-Message-State: AOAM5311i1EST4AKxlIlSq0ZbTa9Q3P4tEUNeuHmKFiOZnMTdkqvq2xj
 UPwoRG4QCnaCOgzjhTOYcgw=
X-Google-Smtp-Source: ABdhPJxUiT7rOSgd051z0D/1SruFASQ3e+XYwYnRSJ3ubY0a6rrSZgX8yoSDkfhMgZT91t7hzB+yyA==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr16465908wmf.167.1619967858387; 
 Sun, 02 May 2021 08:04:18 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a2sm5597717wrn.13.2021.05.02.08.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 08:04:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210501221350.501946-1-philmd@redhat.com>
 <20210501221350.501946-2-philmd@redhat.com> <20210502062131.GB477672@toto>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a08604f-5154-66e2-5bd4-b7aaf7908367@amsat.org>
Date: Sun, 2 May 2021 17:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502062131.GB477672@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

+Damien/Luc/Markus

On 5/2/21 8:21 AM, Edgar E. Iglesias wrote:
> On Sun, May 02, 2021 at 12:13:49AM +0200, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
>> handler is called automatically when its qbus parent is reset
>> (we don't need to register it manually).
>>
>> Convert the generic reset to a enter/exit resettable ones, and
>> remove the qemu_register_reset() call.
> 
> Hi Philippe,
> 
> The interrupt should be updated in the reset_hold phase, otherwise
> interrupts stay asserted while the device is in reset.

OK. I took some time to understand in which handler the IRQ call had
to go, so I think to documentation is not clear enough:

 * @phases.hold: This phase is called for entry into reset, once every
object
 * in the system which is being reset has had its @phases.enter method
called.
 * At this point devices can do actions that affect other objects.
 *
 * @phases.exit: This phase is called when the object leaves the reset
state.
 * Actions affecting other objects are permitted.

Do you mind sending a patch to clarify? Personally I find listing what
can be done where easier to understand (explicit list) rather than
being generic and letting the developer choose.

> 
> Otherwise this looks good to me.
> 
> Cheers,
> Edgar

