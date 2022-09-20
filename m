Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F505BEE31
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:03:56 +0200 (CEST)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajTH-0004AT-F9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafCs-00051A-EY
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafCm-0000U7-IS
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663687824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3bUAd+G6F4RAfkcK/HrkOARYdgZNof6FMfOoLsabqg=;
 b=ipTvdE78V2irQT7Yxc3xFnf51s3J+/KN5v4leHnWXU6dJ36yabK6yOHsVD02XsjtAijP+e
 N+Qs+hgx1yLNIgA6aPh/mRSr6BJifACwyibB8XEAehlNiuXUC7sRpSLHa+H3gvwAfOdPRh
 HSNlZSrK3r6aG0uTFZrtIWeJUb0q0A8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-O6VfTiUTMfW8NoizTnUbYg-1; Tue, 20 Sep 2022 11:30:22 -0400
X-MC-Unique: O6VfTiUTMfW8NoizTnUbYg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v7-20020adfa1c7000000b0022ae7d7313eso1289362wrv.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=O3bUAd+G6F4RAfkcK/HrkOARYdgZNof6FMfOoLsabqg=;
 b=wK4SDGdWsfyVKzV+yYD/u+b1RNU0LRkbMazM9bS6kcEKeGnCKxIELK1oMPvvEzelqo
 btSCeKUauwJJJ8iB78eLXNCUDmqs6dMoUJzxusJTmEKabuhEDZX4sPQ3LnvIHtH/Gs96
 8PlFeJ+HJniv3smo1VKzVe/JmuFbpHQYUAGLpbmEbbK5Yz6aJNNlh7FoSrH41fWQ1Dl2
 Wbbbn+VoKYrFN4PSmprmCcbIJ2gw40AnUtvtITrGErf+TMlKgEeEU4u6vGuZNF2Qwji2
 M6ncTmwHyz84XlRFxp6BmH48IY+/T6Ij8gpT41R4zEWRhfB3ke03YZoKtsVhnhNN6Fyh
 INDg==
X-Gm-Message-State: ACrzQf3fPMQTCw0yt5DXQ2xVcsgKLTfpurEknHME4/De5FjZlmVEBRgq
 SkyFGQbCKsp8JrB2lKLoREIRE0PQDOe1Gy0I/GIb/+YRupf+SEgpePbB/Kb0Ws73iUPo0hQG4Nz
 M+UWb17lR2WSEwTI=
X-Received: by 2002:a05:600c:434c:b0:3b4:82fb:5f78 with SMTP id
 r12-20020a05600c434c00b003b482fb5f78mr2839806wme.157.1663687821526; 
 Tue, 20 Sep 2022 08:30:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wcsUoxtfD80NP3fAj1ydLf52KlQnGFJoQ4nqMA0IVG9SI8k2pEcNAJUHZAGg1kWFcQaeS4Q==
X-Received: by 2002:a05:600c:434c:b0:3b4:82fb:5f78 with SMTP id
 r12-20020a05600c434c00b003b482fb5f78mr2839791wme.157.1663687821289; 
 Tue, 20 Sep 2022 08:30:21 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 r123-20020a1c2b81000000b003a62052053csm124277wmr.18.2022.09.20.08.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 08:30:20 -0700 (PDT)
Message-ID: <18a9636d-c6cf-b20b-8679-be62945dc227@redhat.com>
Date: Tue, 20 Sep 2022 17:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 0/3] hmp queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com, dongli.zhang@oracle.com
Cc: armbru@redhat.com
References: <20220915154606.124713-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220915154606.124713-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2022 17.46, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:
> 
>    Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into staging (2022-09-07 13:13:30 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-hmp-20220915a
> 
> for you to fetch changes up to 22269b0436cc8e4aaac975b4c8cb01b343d09661:
> 
>    hmp: Fix ordering of text (2022-09-15 14:13:30 +0100)

Not sure whether it's caused by this merge, but a lot of the avocado jobs 
are failing now in the CI:

  https://gitlab.com/qemu-project/qemu/-/pipelines/643064395

I've seen some few Avocado failures (e.g. with the Debian job) in the past 
already, but the amount of simultaneous failures seem to have increased now. 
Does anybody have a clue what have caused this?

  Thomas


