Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E24492CD2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:56:05 +0100 (CET)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9siB-0004xj-P2
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9sex-0002pO-LK; Tue, 18 Jan 2022 12:52:43 -0500
Received: from [2607:f8b0:4864:20::102d] (port=55232
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9sew-0002VW-2J; Tue, 18 Jan 2022 12:52:43 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l16so12334pjl.4;
 Tue, 18 Jan 2022 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VeWFhAGH8soSH8puPWWUDv0Yn266XF0d6Sv/ERgUwbM=;
 b=S7q0COlYM77YSTfEv4vggtBe0rJ0y1Hk9iO2tsNtERqhTV4CTxMauuWk9zX6U/MRJv
 8Y6pfVolyyJ0vfAmT+mAPKSTDLC481knKN9YSmZo5vtgxcxMB1aK/OEQU3dfS7S5kE9N
 W/dBJ7zqVUzqNNJiPAObJcs/nf3lPjEE2KwdHaTk4O53C6Y9OtRdObsj9mJvVp0MH+mJ
 2nTLzQqGcPkoKKf/8nWUZyFCLYitqnwlqmRTSoo8RaOz6o3tjJMIx5qoZcxqWOfnTnRf
 3ofUr0D8s3a9JRDGbldyujaoCiuMFVXx5FEcLoFJI6eLS5UMqbTjOSt6Tv/cZxwfGXdN
 z7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VeWFhAGH8soSH8puPWWUDv0Yn266XF0d6Sv/ERgUwbM=;
 b=V/BdadJKQSQJaDFmxcYohEKvLkEb/liPFd895JIEjiyQAWQHNZpXxdPu7WqvvLteYo
 0ayqyXxVbEAvj43OKNqfcN3RZBDqVUpGftqvmDEINALvTG4QGaFppiLaBu/bFb8XkFZc
 O0b0SrznS5tZ4hzuU7okloCAb7mmbIU7iqoWlYdHHCxyWp1TLEPudZycJw9wxlUCnAWW
 KASIajCBNInoqqALoyTh5FOGWVV3QUAJLTdduJ6EObyMLMi4hAceCDGdK0FL4aoe3+rh
 qK86B1ToDl43Ed6DWNORodvXxdmVZj1aGjOkxJPwd4S2YLc81Zk0AekkiMQBDXV/HO5i
 iG+w==
X-Gm-Message-State: AOAM533Jdc8vtOPjb+NiEsjwKD29VSErFA70D6jXc9apKFjiycHewHb8
 q0F0KvxR2WiWT1U20t7VfLc=
X-Google-Smtp-Source: ABdhPJyvnGHYFgKpqgPpmBrbZHWrtUIZtEsh8uqO9xvTVIdBtCck+/hiOUaYPgjFO161X5R7QPJbwA==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr26744930pjb.49.1642528360236; 
 Tue, 18 Jan 2022 09:52:40 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e10sm7940196pgk.5.2022.01.18.09.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 09:52:39 -0800 (PST)
Message-ID: <2135d665-5ec4-c70d-1d23-d1bce37b6b24@amsat.org>
Date: Tue, 18 Jan 2022 18:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] meson.build: Use a function from libfdt 1.5.1 for the
 library check
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220118170548.97288-1-thuth@redhat.com>
In-Reply-To: <20220118170548.97288-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
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

On 18/1/22 18:05, Thomas Huth wrote:
> The fdt version test in meson.build uses a function from libfdt v1.4.7,
> but we require version 1.5.1 nowadays. Thus use a function that has
> been introduced in that version instead.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

