Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAB2CFC23
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:45:06 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klagD-0005S9-Hu
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaYB-0005Bc-Ad
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaY9-00070T-NJ
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607186203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+WJtQG6C1q5tP6A9bzt5FebLFcEDcnk0VAn8DkxFNI=;
 b=HaKzxci3Y6+6VD0k0xPGb4ivUiJ2Vv9i+VTU5coT1190BvixAFTvSIVEnAmI2kyNPfKa2S
 RujA0cbE3jLhFwdPExIK++nTqVE1PvR7NkRCmcpq1rRUZQW722ZSQg5dby0kHEz1zqKjf3
 aCOTUpE6Y/9bncsD8qhLUZR7oNbcpPM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-IU9v2KOVObaW7xvzDCpCgw-1; Sat, 05 Dec 2020 11:36:42 -0500
X-MC-Unique: IU9v2KOVObaW7xvzDCpCgw-1
Received: by mail-ed1-f70.google.com with SMTP id cq17so195657edb.17
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 08:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L+WJtQG6C1q5tP6A9bzt5FebLFcEDcnk0VAn8DkxFNI=;
 b=ioSxRcNGjnqJRgfDASfx3Sw/DTPmMMEIrARJFT80MBk3U1hmynwVg8xE1KYyWG43SU
 wTAGQMCmfuD/iLRoOOI5iN9LLB5BjG7BkRgS6LV4tfRXdzEznAGIywIzEh+GF5mDDMFB
 6UuXd7r3cz+KmUHxxK2/+4aE/ycLXHBe8tN8y+p18FNgF86YphiYyX1Xm8v7kS4CVF/x
 gw7lQtaj7jbyN2xMUDiPlnv61kZ+FSKAYlrQ4gLxKqS1JzQWzlf11PQOiSXpEGc1PEn3
 cw4TmwW0d53fCcxdLyPUw0dx42/HaXAQoFZxUGjntrENgSRdqE+1iMKed5EDGrbCjKoQ
 IBqg==
X-Gm-Message-State: AOAM53280GJGngMquUG+yGmqnvPB9mB1iOmgJ909QDS49yFLoxDzAiIV
 MH0rdzidUuiqon2ecTzJXAJ+lkxCaQqze4n/9tH1hLK8SCFSmFBo+v2GUBosT71EGIyscapkb8F
 V12OK9M9V4kIyyTY=
X-Received: by 2002:a50:da08:: with SMTP id z8mr12795912edj.170.1607186200932; 
 Sat, 05 Dec 2020 08:36:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE8BHnBkAi6Vhh939D72LpxyUgWHTrMgY81tm39CbfNwP2dgfpi7Mnx8lZ5DGpFmvFkOizWQ==
X-Received: by 2002:a50:da08:: with SMTP id z8mr12795905edj.170.1607186200804; 
 Sat, 05 Dec 2020 08:36:40 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u8sm5901935edr.2.2020.12.05.08.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 08:36:40 -0800 (PST)
Subject: Re: [RFC v8 12/27] tcg: make CPUClass.cpu_exec_* optional
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201205161518.14365-1-cfontana@suse.de>
 <20201205161518.14365-13-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ab3a92c-c99c-1361-b32b-950bd58a7908@redhat.com>
Date: Sat, 5 Dec 2020 17:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201205161518.14365-13-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 5:15 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> This will let us simplify the code that initializes CPU class
> methods, when we move cpu_exec_*() to a separate struct.

[newline]
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/tcg/cpu-exec.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)


