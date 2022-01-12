Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284F48BE65
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 06:43:02 +0100 (CET)
Received: from localhost ([::1]:39306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7WPU-00080A-MV
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 00:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7WML-0006we-IN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 00:39:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7WMI-0003xi-0h
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 00:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641965980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pq2h8At+tDzaDH9co3YDSv8+HZhMXfItviY2AY0Eag=;
 b=c+5UcEqsd0QTNdjdPN7HQRQ6tfPYJwAJKeitUm4Rjj2jlp7Xc4THd5rCIPrnxyjK6LaXo1
 Iz5VPSnjXab9gvjH7xa+ByXpKwr4MmPASnJxrlydofLObF4voTMH42A/vt1/8pwBkpsvV5
 wOzy6gCA6eOb2Kkoyi3s4Rqh7IlVxhM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-jhSWpTJJNda8E74Omb_evQ-1; Wed, 12 Jan 2022 00:39:36 -0500
X-MC-Unique: jhSWpTJJNda8E74Omb_evQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 v8-20020a17090a778800b001b2e6d08cd1so1815639pjk.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 21:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1pq2h8At+tDzaDH9co3YDSv8+HZhMXfItviY2AY0Eag=;
 b=LoishW1H5733GsOLKjvSjY0gU+sH/jB8nfkOnAOrn4K89v287F38/SCjfQ2CHF9tzx
 alLTVsGTW4uXoWu+Tt7v+uOfB+bNuD7Boq+chG0r+pyMooS+mic2UT3dxIJqhrhDQQEq
 HGh9H1nam6dlOAs+bGSl+Pf7XIxLEso0qdRtVa35fIyhAv/29KvSa9WLjN1uhs0QmQRT
 YMhpD8LLjlL8qu4lhkfm1lwoCWtXYA8elPdHRNy/DEEa64JZZnS7L11tf77Fy+XPafla
 DRMxRs+xmqixyEk1HyzgEQdtiMv+Qj2WB+TPueLHVFw1CRaIZF/QmwPWyT6iM2wlUyTs
 wl4Q==
X-Gm-Message-State: AOAM530fKox2Yy7gUbs9z0lqJydH7YSoSiM9peEBwqHZnOwo4+ZuZ2QT
 92PRN94csaokGWPsMnHZejqq0YdpnoERrRZZm7KVYdUC6DU8IJc+59UN2MdmGzucS5E/crqBdho
 n0aRyouZQQM2ZdsU=
X-Received: by 2002:a17:902:76c2:b0:149:7fa3:2ace with SMTP id
 j2-20020a17090276c200b001497fa32acemr7652917plt.64.1641965975327; 
 Tue, 11 Jan 2022 21:39:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycw0WV1cBBPiV/ZL2+WWhDN30Hk3qrSQjWKMIFI1SPsKab8E4rAomxNNdcNUiqvjG6Z50vxA==
X-Received: by 2002:a17:902:76c2:b0:149:7fa3:2ace with SMTP id
 j2-20020a17090276c200b001497fa32acemr7652901plt.64.1641965975037; 
 Tue, 11 Jan 2022 21:39:35 -0800 (PST)
Received: from [10.72.13.115] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h3sm4015518pjk.48.2022.01.11.21.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 21:39:34 -0800 (PST)
Message-ID: <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
Date: Wed, 12 Jan 2022 13:39:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PULL 00/13] Net patches
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
 <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/12 上午6:02, Vladislav Yaroshchuk 写道:
>
>
> вт, 11 янв. 2022 г., 5:10 AM Jason Wang <jasowang@redhat.com>:
>
>     On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell
>     <peter.maydell@linaro.org> wrote:
>     >
>     > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com>
>     wrote:
>     > >
>     > > The following changes since commit
>     df722e33d5da26ea8604500ca8f509245a0ea524:
>     > >
>     > >   Merge tag 'bsd-user-arm-pull-request' of
>     gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
>     > >
>     > > are available in the git repository at:
>     > >
>     > > https://github.com/jasowang/qemu.git tags/net-pull-request
>     > >
>     > > for you to fetch changes up to
>     5136cc6d3b8b74f4fa572f0874656947a401330e:
>     > >
>     > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)
>     > >
>     > > ----------------------------------------------------------------
>     > >
>     > > ----------------------------------------------------------------
>     >
>     > Fails to build on OSX Catalina:
>     >
>     > ../../net/vmnet-common.m:165:10: error: use of undeclared identifier
>     > 'VMNET_SHARING_SERVICE_BUSY'
>     >     case VMNET_SHARING_SERVICE_BUSY:
>     >          ^
>     >
>     > This constant only got added in macOS 11.0. I guess that technically
>     > our supported-platforms policy only requires us to support 11
>     (Big Sur)
>     > and 12 (Monterey) at this point, but it would be nice to still
>     be able
>     > to build on Catalina (10.15).
>
>     Yes, it was only supported by the vmnet framework starting from
>     Catalyst according to
>     https://developer.apple.com/documentation/vmnet?language=objc.
>
>
> Yes, there are some symbols from macOS >= 11.0 new backend
> uses, not only this one, ex. vmnet_enable_isolation_key:
> https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation_key
>
>     >
>     > (Personally I would like Catalina still to work at least for a
>     little
>     > while, because my x86 Mac is old enough that it is not supported by
>     > Big Sur. I'll have to dump it once Apple stops doing security
>     support
>     > for Catalina, but they haven't done that quite yet.)
>
>
> Sure, broken builds on old macOSes are bad. For this case I think
> it's enough to disable vmnet for macOS < 11.0 with a probe while
> configure build step. Especially given that Apple supports ~three
> latest macOS versions, support for Catalina is expected to end
> in 2022, when QEMU releases 7.0.


That should be fine.


>
> If this workaround is not suitable and it's required to support vmnet
> in Catalina 10.15 with a subset of available features, it can be done.
> But I'll be ready to handle this in approximately two-three weeks only.
>
>     Sure, Vladislav please fix this and send a new version.
>
>
> Quick fix as described above is available in v10:
> https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/


Have you got chance to test that for macOS < 11.0?

Thanks


>     Thanks
>
>     >
>     > -- PMM
>     >
>
>
>
>
> -- 
> Best Regards,
>
> Vladislav Yaroshchuk


