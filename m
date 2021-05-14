Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9325380E8D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:03:57 +0200 (CEST)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbEC-00040m-9l
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb3m-0002xW-HP
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhb3k-0000zU-O6
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621011188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zw2+9Sks6CjLdFfGcs0AYkvKc3vmkZzfTB68ohGXi6I=;
 b=fik5fcsBU/ybo2NcA+DX/c1rhSKwei1Bjrlgv6C+fu37NSRViQBt7wGYocOntqROf+kWSN
 jz4Zdj7PuDgYjiExHGBchm0QKXAGcvSzSRDQuBZ33Bdo6SOVUwIBadpG6PcqdhdjHlOtRe
 eMT11S2lIsAtp76H2CHfcL6m13ARdVY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-efHQEJGaNAKVAC2Pkgg6NQ-1; Fri, 14 May 2021 12:53:06 -0400
X-MC-Unique: efHQEJGaNAKVAC2Pkgg6NQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 l6-20020a67d5060000b0290228235bc72dso13161728vsj.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zw2+9Sks6CjLdFfGcs0AYkvKc3vmkZzfTB68ohGXi6I=;
 b=l2dmP/kY+tlIOXABkXktAsFVg7BWxcRoLQKyfbLKpe3jaEiI+4FgRmcRG+nVUvXeUw
 n6La3d439OFPp4VF8oXeJ+EEiVUibcnEy45s8sxNMzraTCNzlaVhUqIQ7qJUs6TcOz31
 WRJveEMc/v4d2TYpfs9bSDWO6ufxP0B7Uy01OkKb76KvHXxMIqbrbLo2NZlb8vwOZevl
 sEacxtfvQaDo07r45qgjLeMXGkf1vRnCej8sKzgVbnoxNOy1YvMfj40SY0alkLXoee8b
 V1flEmoStv5PRkDg6KYCwFLAGRHvviUuFV1/iSbil75zW/MiNEYkNG3WFayPbcZ1AMaf
 569Q==
X-Gm-Message-State: AOAM532xAfqgFmSIBwTbnVWuROwvfrJfG5XmJ7XbBgk69yW7Ufb3KjzR
 Bz3xG6YzSw03uJei5NoXtmbM8SiuKP/UTOZWsK/6CjMyBb5ZzGLrS9QP+dsG4S59Yt4pJbLtmT3
 yQAPeDkeBTXgnZeLPfZrnvWMtlSqkaJY=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr2815340vsj.1.1621011186090; 
 Fri, 14 May 2021 09:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd224inw6TlsXf9HLZ/mZsT8RrFV91jsWheoRn8EkNMo0xMd3AIk88qpStYI3x64dLvQRDAG0K/rDqUMWJHGw=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr2815334vsj.1.1621011185959; 
 Fri, 14 May 2021 09:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-7-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-7-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 13:52:40 -0300
Message-ID: <CAKJDGDYucxKDcxBRgjWbfhYaAFpod-qoZc0qCxWxD0Uc2oczqw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] crypto: bump min gnutls to 3.5.18, dropping
 RHEL-7 support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:04 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gnutls version
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 3.6.14
>       Debian Buster: 3.6.7
>  openSUSE Leap 15.2: 3.6.7
>    Ubuntu LTS 18.04: 3.5.18
>    Ubuntu LTS 20.04: 3.6.13
>             FreeBSD: 3.6.15
>           Fedora 33: 3.6.16
>           Fedora 34: 3.7.1
>             OpenBSD: 3.6.15
>      macOS HomeBrew: 3.6.15
>
> Ubuntu LTS 18.04 has the oldest version and so 3.5.18 is the new minimum.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml | 15 ---------------
>  configure      |  2 +-
>  2 files changed, 1 insertion(+), 16 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


