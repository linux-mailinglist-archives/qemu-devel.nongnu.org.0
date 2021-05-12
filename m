Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1237B4AA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:43:30 +0200 (CEST)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgfmT-0007KF-Es
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgflT-0006RE-Rp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgflR-0007oP-Cy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620790944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9uviigig0pA0qdhReto4ex6LUFjkONv6IEGaN33b5Y=;
 b=MkU7VY19MK1JLTE0V83vJPe8lRL8QY6w3UcOr5fA18uvdr6pHRBkhaHVRo4Iz9grNcd/qY
 48CbCW2W9F5dQN1I+J+KFTdaHM4ZMoIxtc07Eyn1wtn9MLPejVPH4xrj6ujjgPUZCony60
 uHl8NShjV1z3RolKfekulTCxWZPuj9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-rTCTyCj3PQu2DQ68YjYn-g-1; Tue, 11 May 2021 23:42:21 -0400
X-MC-Unique: rTCTyCj3PQu2DQ68YjYn-g-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso123906wme.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l9uviigig0pA0qdhReto4ex6LUFjkONv6IEGaN33b5Y=;
 b=CWMZ/uxjEtksGYWR0K27vmyGzaJxxoI1IGRp4eI7Li3Q7cKBqRN9eHjBRIuj9/LORD
 wVZ9kbqBtZ/RMiRjdWO09jo/VvFgxnoJFVZL+RLaEa3bpvinT4wq9T+9G4u8hqXZNLo+
 hXTY4Zdg1r3+RgkfK5b+sQZHKl6JQfiEx6eVu600Rk+5Qy+GXV0Pyr4aAqAqAdDGhu3H
 IXe+vLeptzgp3bgpumJncHdTMmrgEMsQRdIv6iPrNi+8HS+e40tNDYgHCMegZXchVxyF
 h9o8/zxCeMzexnG5bAmPjjNINnuNsul9ZG2/1fIw3GdvOfKo8aJeWdljhrItD5AuID3P
 mP6w==
X-Gm-Message-State: AOAM531w2gsLNHBAQ0lm/2kvM6ccjvL3WwfyBrgVgAVpvz65q+XLej5j
 qZMj+WEhSh8sNP3Ni4G2YJKp2pKvhhA7+zbVO6nJeWVb62CfDT0lZ3JZTwxq0LNQANR4+GwcMv2
 zNj0S1b91Wuuv6Xo=
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr41825712wri.74.1620790940097; 
 Tue, 11 May 2021 20:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7/EiIz/dcujooNnJQ7naMDub62hIir13xcVFh+5DPkh6t4ImDzsjKYS5m2lBFKJHBnbwH/g==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr41825691wri.74.1620790939795; 
 Tue, 11 May 2021 20:42:19 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a9sm28530808wrw.26.2021.05.11.20.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 20:42:19 -0700 (PDT)
Subject: Re: [PULL 0/1] NBD patches for 2021-05-11
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210511192802.552706-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af7caaf7-3067-9ebf-96f4-73e4a3dbc8d9@redhat.com>
Date: Wed, 12 May 2021 05:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511192802.552706-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-stable@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 5/11/21 9:28 PM, Eric Blake wrote:
> The following changes since commit f9a576a818044133f8564e0d243ebd97df0b3280:
> 
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210506' into staging (2021-05-11 13:03:44 +0100)
> 
> are available in the Git repository at:
> 
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-05-11
> 
> for you to fetch changes up to 37179e9ea45d6428b29ae789209c119ac18c1d39:
> 
>   sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog (2021-05-11 12:43:26 -0500)
> 
> ----------------------------------------------------------------
> nbd patches for 2021-05-11
> 
> - fix fd passing to qemu-storage-daemon --nbd-server
> 
> ----------------------------------------------------------------
> Stefan Hajnoczi (1):
>       sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog

Richard suggested to add the following tag to the commit if possible:
"Resolves: https://gitlab.com/qemu-project/qemu/-/issues/218"

https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03107.html


