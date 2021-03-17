Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8A33F740
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:41:01 +0100 (CET)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaAG-0006wx-E8
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMZus-0003P7-AD
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMZuq-0001sa-HH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616001899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmwNayOPy1B6qiFM27qTS/0bvF5X0zULx/gL7bxDzvE=;
 b=fKoW2z7S20ZR5/INU+h5AKUEXD5ZiBhsyqryulW2A2VcByIcp6sAJMW1BaF8yc+/yY+rf9
 6+1uQ2++mWhKtOtrDXmSuR/j6pRtZs+C03CA8H+StCKB0opIRHl5G023fZhKGI/umvf6nx
 sDug52zZY8nZeyBlPF1dUAwEIpR8Jsc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-2vDjtsHnMYODZD2GZJm4Mg-1; Wed, 17 Mar 2021 13:24:55 -0400
X-MC-Unique: 2vDjtsHnMYODZD2GZJm4Mg-1
Received: by mail-ed1-f69.google.com with SMTP id h5so19792190edf.17
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmwNayOPy1B6qiFM27qTS/0bvF5X0zULx/gL7bxDzvE=;
 b=ILRnMHBvWT6hrLTV0rKeuGyTpG+tVhWOvQzIAeU8v92RLyhBC67INu5z3QlUV2Csz2
 Df1kADmRTL50QAO3CcMTZBSxl9dbMLohCZkityAvKWlOxg2hLgVGi9DZtucCzOiqaQGt
 k+32wXNO0hZsh2qPRMI0KEWPm7803IKdXrmxCQnPZgIuQAoXhcZ51uqvVRc4mDAMTXyj
 p4EwstoFIyBHXOMEjXtRDIzlApqn5M/ijruPpShG1csn06nCjDrIaUl7p/uTJVxlHYgW
 2t58fMAoxpHirZcdS961UWyK5Gh7i1a0wHv2KpQk7hZWphp97OZpq4NnAtWdfYzRArdN
 9QTA==
X-Gm-Message-State: AOAM5310Qe0q/lSVUaFtbOJg7QEGMQ+axyn6qyFVy9BVv6835DLZT2cj
 kXrc/P5+x4cDAykhw6fwPJiB6bduatCQxhN3RqA78r8ZNTsZ6YAel4rAqz9LgdeY5cRJNEhnmS6
 2KH5Wq4GAY2sMIIg=
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr36358639ejf.277.1616001894421; 
 Wed, 17 Mar 2021 10:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza+TmtszY3UCQv8S25WhPVfHvFvIBjFPbD2clhK5VD9/0O5BHfVB/PL0ZUIIi0iv+Nqc1umA==
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr36358623ejf.277.1616001894248; 
 Wed, 17 Mar 2021 10:24:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm13389775edx.62.2021.03.17.10.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:24:53 -0700 (PDT)
Subject: Re: [RFC PATCH] support.md: add a link to matrix bridge to IRC
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210317160259.14098-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d145b7ad-0c10-daa5-045c-03360f9a3423@redhat.com>
Date: Wed, 17 Mar 2021 18:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317160259.14098-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 17:02, Alex Bennée wrote:
> We want users to be able to use newer tooling and not be stuck with
> IRC like the rest of the fossils. As the #QEMU channel is bridged by
> the matrix.org server lets point there as well. At least it's not
> Slack.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   support.md | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/support.md b/support.md
> index f6ee85c..252351c 100644
> --- a/support.md
> +++ b/support.md
> @@ -33,10 +33,12 @@ want to send your question to another of [QEMU's mailing
>   lists](https://wiki.qemu.org/MailingLists)
>   
>   * A lot of developers hang around on IRC (network: irc.oftc.net,
> -channel #qemu).<br> QEMU developers tend to hold normal office hours
> -and are distributed around the world. Please be patient as you may
> -have to wait some time for a response. If you can't leave IRC open and
> -wait you may be better served by a mailing list.
> +channel #qemu, also available via
> +[Matrix](https://matrix.to/#/#_oftc_#qemu:matrix.org)).<br> QEMU
> +developers tend to hold normal office hours and are distributed around
> +the world. Please be patient as you may have to wait some time for a
> +response. If you can't leave IRC open and wait you may be better
> +served by a mailing list.
>   
>   * If you think you have found a bug you can report it on [our bug
>     tracker](https://bugs.launchpad.net/qemu/).<br>
> 

Applied, thanks.

Paolo


