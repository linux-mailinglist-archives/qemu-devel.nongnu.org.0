Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE949B977
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:59:34 +0100 (CET)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPAL-0004pF-Px
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:59:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCP5w-000203-9s
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:55:00 -0500
Received: from [2607:f8b0:4864:20::636] (port=36565
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCP5t-00020h-Vx
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:54:59 -0500
Received: by mail-pl1-x636.google.com with SMTP id b15so5326799plg.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=qDE+mb1mMh2scN3w0bXYeClJH9tGX38gYi5qAJmTnpo=;
 b=W00yrs16g/6EJO6BoPY0sx68sO3Vd0jAaGltSN6yXPvvsS03yU3zyZZ9YflW22fbqz
 zNapH0D7rStHd1/LKG7jcSlYrpA+8mT+uHNGLjh1KlWEbbejxG7ouaMh3EpZRN/jFqIz
 38mZn8PfLuf5BkVr8rlX45aYH4FYhpRJsveNlHjzf2cU/GfE+h59Pr4aXpuZAZty9Rag
 K8lt8zmGYGFf5YhYefjeBcjTBbcuBdddxKMxRG2psoyDa3Cc8AyyfUxCTsr0Ph6A/43I
 FS8Twu4dzvOi8hLOgpdCKhgMAtWdOBB9Vuv8nT9+0oNq/Oo1JJQJhNiM+GjpcGeRbVTh
 ERvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=qDE+mb1mMh2scN3w0bXYeClJH9tGX38gYi5qAJmTnpo=;
 b=A5HZhJsGMvS3xykrmn+0WqCNvCa3i0SbJWWOfrYkUGPzylp2UTCY08p0UQuV+xTJV6
 CjmMRJ2W2lf1ciPb9eQ9fx3wWsBf5eTphNrsjAR8vF/T6cpMi9o3zti95ni2y3LcALzP
 h8hgX+A3jAY1Vg6PDvTEfLhEkO1kf3ZoBOBextbUWBKjfrJjMcrHHUntPHl/BlFhqEIk
 CltcoIKJCwKIUu/6uebo6XGbEqg9Y7TUF6DTspxjz9VwQFQX7guBi9Rm2H221B/7m7PO
 n6W751VsDfRnSalIlQtL3jh0hbtp9ngK1oKJwUee9JBKLPsv1WajW2CbXhVR4iNiWlYF
 FSIg==
X-Gm-Message-State: AOAM532g9FutbrxJmmrSuJJ89SGNNjd8v/zEgeEvAy9MriYCBqsfjrrv
 DbQyYfbLkG57OK1MZ8GjhoE=
X-Google-Smtp-Source: ABdhPJx6NPAGZW4w2N74AMf0RUAV34NDIF7gG2jyU0emngZ6U5D1u+SXKeNw0VBNng79qKm4b34+FA==
X-Received: by 2002:a17:902:d712:b0:14a:d880:f20 with SMTP id
 w18-20020a170902d71200b0014ad8800f20mr19866967ply.41.1643129688446; 
 Tue, 25 Jan 2022 08:54:48 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z13sm6717038pfj.23.2022.01.25.08.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 08:54:48 -0800 (PST)
Message-ID: <6ba8efb0-b4e0-dbda-e1f1-fac9dfa847fd@amsat.org>
Date: Tue, 25 Jan 2022 17:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: KVM call minutes for 2022-01-25
Content-Language: en-US
To: quintela@redhat.com, kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
References: <87k0enrcr0.fsf@secure.mitica>
Cc: Mirela Grujic <mirela.grujic@greensocs.com>
In-Reply-To: <87k0enrcr0.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 25/1/22 17:39, Juan Quintela wrote:
> 
> Hi
> 
> Today we have the KVM devel call.  We discussed how to create machines
> from QMP without needing to recompile QEMU.
> 
> 
> Three different problems:
> - startup QMP (*)
>    not discussed today
> - one binary or two
>    not discussed today
> - being able to create machines dynamically.
>    everybody agrees that we want this. Problem is how.
> - current greensocs approach
> - interested for all architectures, they need a couple of them
> 
> what greensocs have:
> - python program that is able to read a blob that have a device tree from the blob
> - basically the machine type is empty and is configured from there
> - 100 machines around 400 devices models
> - Need to do the configuration before the machine construction happens
> - different hotplug/coldplug
> - How to describe devices that have multiple connections

- problem realizing objects that have inter-dependent link properties

Mirela, you mention an issue with TYPE_CPU_CLUSTER / TYPE_CPU, is that
an example of this qom inter-link problem?

> As the discussion is quite complicated, here is the recording of it.
> 
> Later, Juan.
> 
> 
> https://redhat.bluejeans.com/m/TFyaUsLqt3T/?share=True
> 
> *: We will talk about this on the next call
> 
> 


