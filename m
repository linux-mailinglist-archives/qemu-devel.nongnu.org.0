Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69248557E6C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:03:57 +0200 (CEST)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ONA-0006q8-Hl
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4OKP-00044M-6i
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4OKI-0004R6-Qy
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655996458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tc4eYlnI9Xq07NLvVOhtYJP9Xw6VhBC5lMFANpnQK3k=;
 b=dJO+aIpmnSpPHpc2aDehnTvYrk3Db7Seyy26sDRvFz2Fe+LFXGQL+oQnrrLava48P0/Lya
 O7xGwFW+ACt9AM2kQCRwX94arEjJ1P+m2iQy3++vAws720La1QewjGb11yRzeLZejqwXtT
 +3+X/Yrny/zWvT2I5DzPLjG1bpYDv+g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-ZrW2wn0mOBSkgn_VBHOmkQ-1; Thu, 23 Jun 2022 11:00:55 -0400
X-MC-Unique: ZrW2wn0mOBSkgn_VBHOmkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so1538197wma.5
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 08:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Tc4eYlnI9Xq07NLvVOhtYJP9Xw6VhBC5lMFANpnQK3k=;
 b=A0m2VJi8lvLGdZXsTfFAZmMUaj6vhu6Vt84LMI20IK3JRI+5cYZL+hD3USYTxKlXHl
 To7OJAkvzcCorS1f5592TJKhzKCoqOu0Ev6+iYRQxVu6Fn0XmwpKuQwFuTsTiRiBbhOs
 KMiV8mLUIIA7KBmKHu0IO5ozlCzRoRyffpl3vYdZdvZ7dBwi3IxGG6qSJDxsxd4/B4xF
 fnOBcP673WJN/CBnLGQ/GDvWBazbi/R6XxNs9bBWcOZHMUgOg5Avl8RLQSM0zzPX/lqw
 hfhuoJPJrmyu/9p308E0cStvoG6v0EdnRFu+6OCMy5EFC9MmhyKtL88UZnmyl02LyS/6
 w3ug==
X-Gm-Message-State: AJIora9aFyF5AQcFwViYNHLOKAeMrJZOHaE4A0fKo6WgqJX581fRSqN2
 fMLvZRldGmey7dOBczrugnSrBZtF+7kUKx4XoO4a9I1HwiM+VUhJuJStFEB6KONpW1CwH74oRcr
 5GzQeYt0f3AwuoWo=
X-Received: by 2002:a05:6000:18a9:b0:218:7791:a9ad with SMTP id
 b9-20020a05600018a900b002187791a9admr9274381wri.116.1655996453186; 
 Thu, 23 Jun 2022 08:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgG8h5weYysItVUnV3+YBPXYgAEu1932iVqBf5lNO2Dq7/ZjaCkglSBmXMlij30NJeuat1gg==
X-Received: by 2002:a05:6000:18a9:b0:218:7791:a9ad with SMTP id
 b9-20020a05600018a900b002187791a9admr9274356wri.116.1655996452921; 
 Thu, 23 Jun 2022 08:00:52 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 e5-20020adfef05000000b0021b99efceb6sm7977113wro.22.2022.06.23.08.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 08:00:52 -0700 (PDT)
Message-ID: <4903b576-d551-d3d0-cd89-66c103ac8572@redhat.com>
Date: Thu, 23 Jun 2022 17:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Qemu-devel] [PATCH] gtk: Add show_tabs=on|off command line
 option.
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Felix_Quei=c3=9fner?= <qemu-devel@mq32.de>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, Igor Sudarikov <4seev3@gmail.com>
References: <56D0203F.5060303@gmail.com>
 <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
 <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
In-Reply-To: <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/2022 16.59, Thomas Huth wrote:
> On 23/06/2022 16.36, Felix Queißner wrote:
>> Heya!
>>
>>> The patch adds "show_tabs" command line option for GTK ui similar to 
>>> "grab_on_hover". This option allows tabbed view mode to not have to be 
>>> enabled by hand at each start of the VM.
>>
>> It's been a while now, but i was always missing this feature in QEMU and 
>> i'd love to see that patch land in QEMU one day.
>>
>> I discovered that patch by searching for "start qemu with tabs visible" 
>> and found this link:
>>
>> https://patchwork.ozlabs.org/project/qemu-devel/patch/56D0203F.5060303@gmail.com/ 
> 
> 
> Not sure why it was

I wanted to say: "Not sure why it was never picked up"... sorry, I hit the 
send button by accident too early.

  Thomas



