Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0437759C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 07:31:38 +0200 (CEST)
Received: from localhost ([::1]:50156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfc2S-0007pq-VI
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 01:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfc0Z-0006z2-Au
 for qemu-devel@nongnu.org; Sun, 09 May 2021 01:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfc0V-0006o2-HP
 for qemu-devel@nongnu.org; Sun, 09 May 2021 01:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620538173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LC6H4sxOezwFjICMSVGaNd10Utf5FoDBZj2oRvb2dkE=;
 b=hnQFv1oQELrYnD62jdI6zfQ3fqLcd4Oi/mIG6ssEaULHzKzt/5JEuqPZjZ/gHQAcVOl6LH
 i1bv4LdnVQce8YIAeLsHk4rlT2QF7dhoW5eeMAbTgeoADLNzCt4xd7Ut0fwDRfGtxU0B5i
 Gr62TR5JzSIgW6fLQTsKGLLX2nHQ+Uc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-f25kPyV0PfuVRVI-wGwAbA-1; Sun, 09 May 2021 01:29:31 -0400
X-MC-Unique: f25kPyV0PfuVRVI-wGwAbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t7-20020a1cc3070000b029014131bbe82eso5700755wmf.3
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 22:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LC6H4sxOezwFjICMSVGaNd10Utf5FoDBZj2oRvb2dkE=;
 b=hK4EPYEJP+/jrQjGUY/7SdPBO1e+aqs+NVmjPQ2us+HobBZG3zEDxqnY2fYvzilok2
 4CQttqcFi0GSBtuYbeYijq1VJn7uvqUan9dsShGeZPgCwXZcb8A86u+ed/xcU4JMDeC3
 8J/LoX6zFFQddDu3hYH//yYaxYDc84lxMT1BEy5bkKUQEWd4mx9OTQXYNfqOpwnLSHxX
 f6wI50n4X4sXx1v+yRyxvyzVAhxmDWTzp9GN1JIORLfIlMbFE58SOFsZc3v+wMYIq9o8
 P/k6lqhGD/B6KIBgAfjtTwvlfNX1iDjwuyC+eV4fC+LOHWrELphbIP+F7o4k/ry8TqMd
 1eIw==
X-Gm-Message-State: AOAM530bW0G6WnUZhh/eTmxVjhoX6q0+QTweniavmAZFczRiA4mbveWu
 t1Uh5isU8knR5fyxkJUmgQoo3QaOy+OVCTo5kNUytJrCFhcQ1dTXip9bMDvlVuoPhYuzf+fIgLd
 BGEWi3rOf4E3D9rs=
X-Received: by 2002:adf:fb07:: with SMTP id c7mr22589052wrr.88.1620538170414; 
 Sat, 08 May 2021 22:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAmSy1FQXPRfEjqMyxZl5oeHfYc+wMCQ34bJOZrbNHBPk6wZr4Or2igO1kA66krS0CYpjBgw==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr22589029wrr.88.1620538170138; 
 Sat, 08 May 2021 22:29:30 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id e38sm19654320wmp.21.2021.05.08.22.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 22:29:29 -0700 (PDT)
Subject: Re: [PATCH trivial] hw/gpio/aspeed: spelling fix (addtional)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87f7c83d-ce4d-a1fd-66d2-cf98ee525f73@redhat.com>
Date: Sun, 9 May 2021 07:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, rashmica.g@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 11:36 AM, Michael Tokarev wrote:
> Fixes: 36d737ee82b2972167e97901c5271ba3f904ba71
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/gpio/aspeed_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


