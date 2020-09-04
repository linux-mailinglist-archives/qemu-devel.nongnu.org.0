Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A925D30E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 09:55:51 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE6Za-0006b2-BA
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 03:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kE6Yg-0006Aq-Sl
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 03:54:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55010
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kE6Ye-00009m-6Y
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 03:54:53 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-6pVAT4jBMf2eHxCJ1RP_YA-1; Fri, 04 Sep 2020 03:54:48 -0400
X-MC-Unique: 6pVAT4jBMf2eHxCJ1RP_YA-1
Received: by mail-ed1-f69.google.com with SMTP id n4so2357452edo.20
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 00:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2vvTw9mHY1zInOBFiwDzoM7tL/FDv/HDEm9uoQ2oIFA=;
 b=al3e6sOhkOaRQGVCdbVroZRcH55y3lxIyG1JU6HlsYhemnSKLPXzPoB/Z7GmVDmUmu
 DbKYn+kKD539946t8tptCLOy+YxS/7VYG66WaGnUW2R5q8tM9FLN5TAdu+Zqbmi2LYU2
 CeME1k9IMZ0+NwOCzGuULE+7nourhWZJDojIu6GHdrB8Y99RS+krOf74qVY55Np8QUGl
 ENtrwbpx5z//JfH4Ujmn7u8TBqf711VaGRnRm+YIMZKA+0wOFB5lvAhYJYZNPalsbWLx
 JymK+q+CyWCK4bRnCsD/dbTIu4SkRRObnbvJDIigSo2x2On0AbgtmWrEin/qKG9y+0ZX
 EdhA==
X-Gm-Message-State: AOAM531VmDOnfmi7Pwc2wsJPm1CBXiAbJbgmt3/C0LYtzMvBFDF+Gt6O
 Nov7a4foJpP3HAbSjSfrn1nju4nVJLIv3Nq56KkT7Op/Mg3hKlGRFqSM5GkUMW46F5IcgXRyKUs
 k6LvNRWGUdmkp6zk=
X-Received: by 2002:a17:906:33ca:: with SMTP id
 w10mr6569635eja.438.1599206087465; 
 Fri, 04 Sep 2020 00:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9hi6knWKcLtfzKC5LWjiKHUQmtkun8TWmAl38ujHOFVGB7r1Vbuk9IQPrbABal9ZWHj98OA==
X-Received: by 2002:a17:906:33ca:: with SMTP id
 w10mr6569628eja.438.1599206087239; 
 Fri, 04 Sep 2020 00:54:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6276:52ed:96d5:c094?
 ([2001:b07:6468:f312:6276:52ed:96d5:c094])
 by smtp.gmail.com with ESMTPSA id j1sm5376621edf.44.2020.09.04.00.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 00:54:46 -0700 (PDT)
Subject: Re: [PATCH] configure: the error info not consistence with option.
To: luoyonggang@gmail.com
References: <20200903220622.504-1-luoyonggang@gmail.com>
 <CABgObfb8xOr6JstG0MLTwqeNZJXDC7LiecrFQje9VbwZD96Mvg@mail.gmail.com>
 <CAE2XoE9n3KU-bQ4SKhKCjjQVER=b4-4em3HfxCj6qYU+XkBdWw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddcf4e38-717e-87c1-46c3-89df8bc035c2@redhat.com>
Date: Fri, 4 Sep 2020 09:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9n3KU-bQ4SKhKCjjQVER=b4-4em3HfxCj6qYU+XkBdWw@mail.gmail.com>
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/09/20 05:54, 罗勇刚(Yonggang Luo) wrote:
> 
>          test "$vhost_net_user" = "" && vhost_net_user=$vhost_user
>          if test "$vhost_net_user" = "yes" && test "$vhost_user" = "no";
>         then
>         -  error_exit "--enable-vhost-net-user requires --enable-vhost-user"
>         +  error_exit "--enable-vhost-net requires --enable-vhost-user"
>          fi
> 
> 
>     This change seems wrong.
> 
> I didn't found --enable-vhost-net-user option handling?
> you may grep it? 
> 
> 

You're right, it is all dead code.  The four lines are equivalent to
just vhost_net_user=$vhost_user.  You could also add
--enable-vhost-net-user though!

Thanks,

Paolo


