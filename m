Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B96443D4B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 07:29:01 +0100 (CET)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi9lc-0007lz-2k
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 02:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi9kQ-0006wA-2F
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:27:47 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi9kM-0002C5-EB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 02:27:44 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id u16so1871935qvk.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=36QRmvnQnWdrfNhyxX+QBQKXq3ZJrAdsK69ZK+dKUxg=;
 b=YNdjC0GL2ddru9D7CNS980gcdBQwZZX229UsclWp+fVJL19/RjZkdHKpD+P5gMP42H
 yOtZzi1vxz0pt2XnRswDkcsnsdD9z65VQ9uimrTf9zSfRfGoHhSoodjiJUhOLIZ4WE+0
 KzQynuceZG+oh/AvTeQUfm80dRumuJix6w8R+07BFWQ+1ZlAQAysHtUKcnZm+c0geFgm
 kpscdoBEed+3JGdRcW/27sK2/49oJ1WQ/Qdpwlgh+N44W43Rtk/b/+E8Q2X7yxSi2U7r
 MGtiJTdcRgZASIAs/sn1SF1YSnjY4mV309lWhDme98QJczc8HwfeRC6wLynjgGtBAJEG
 puNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=36QRmvnQnWdrfNhyxX+QBQKXq3ZJrAdsK69ZK+dKUxg=;
 b=BW7jF6bpu+gka9BqrUuAyk2Vrt6X6dIF9pUujzlG4sOqwi4aQwGete8HfYkyILSGVa
 yyi7jNmynbGFjfBd9vTGqO1J+0KCjmkwZnWgXHL2I4z0bLbi9BnoVPWna2JwUxB0zq16
 UZu/y4XjQ4Ww59OoJVa7csmIW7oY8HVMTvDQAzdYxKw36HsMEeTRnjOZ6Zk/5VaauReF
 5dKOhHA5yWFSm3H3oMi4fuC95iH6Ic7EMkx+advip9R7L9QxHqGSDvfHF7LWy4txm798
 AlDV5LoQuLB/ow5tK1qd4mx2rZWNkfCuAQKpIzjKEfLdyRNnE3Rk91D6bedOaRMY6f31
 iiKg==
X-Gm-Message-State: AOAM530UO3dul7A6TSqXPL65IjnugTLJ1X75EMS+eeZyolqq+rS1DHN2
 OGvC153tvvZb/0WtcgR+OO6luQZLGgnKSg==
X-Google-Smtp-Source: ABdhPJz0uDGYnG5b+HcP6dRECpW7P+l6RBENY4PMKUseTKotpgoxB09mw+5XrkW+D7uc8t7MfGn+NQ==
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr44892818qtb.178.1635920861287; 
 Tue, 02 Nov 2021 23:27:41 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bq30sm921227qkb.6.2021.11.02.23.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 23:27:40 -0700 (PDT)
Subject: Re: [PULL 00/12] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211102160528.206766-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5110bd1a-25e9-686a-4437-41f6e2b08d35@linaro.org>
Date: Wed, 3 Nov 2021 02:27:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 12:05 PM, Kevin Wolf wrote:
> The following changes since commit 8cb41fda78c7ebde0dd248c6afe1d336efb0de50:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/machine-20211101' into staging (2021-11-02 05:53:45 -0400)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to a8951438946d72d74c9bdbdb38fce95aa2973a88:
> 
>    block/nvme: Extract nvme_free_queue() from nvme_free_queue_pair() (2021-11-02 15:49:13 +0100)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Fail gracefully when blockdev-snapshot creates loops
> - ide: Fix IDENTIFY DEVICE for disks > 128 GiB
> - file-posix: Fix return value translation for AIO discards
> - file-posix: add 'aio-max-batch' option
> - rbd: implement bdrv_co_block_status
> - Code cleanups and build fixes
> 
> ----------------------------------------------------------------
> Ari Sundholm (1):
>        block/file-posix: Fix return value translation for AIO discards
> 
> Fabrice Fontaine (1):
>        block/export/fuse.c: fix musl build
> 
> Hanna Reitz (1):
>        block-backend: Silence clang -m32 compiler warning
> 
> Kevin Wolf (1):
>        block: Fail gracefully when blockdev-snapshot creates loops
> 
> Peter Lieven (1):
>        block/rbd: implement bdrv_co_block_status
> 
> Philippe Mathieu-Daudé (3):
>        block/nvme: Automatically free qemu_memalign() with QEMU_AUTO_VFREE
>        block/nvme: Display CQ/SQ pointer in nvme_free_queue_pair()
>        block/nvme: Extract nvme_free_queue() from nvme_free_queue_pair()
> 
> Samuel Thibault (1):
>        ide: Cap LBA28 capacity announcement to 2^28-1
> 
> Stefano Garzarella (3):
>        file-posix: add `aio-max-batch` option
>        linux-aio: add `dev_max_batch` parameter to laio_co_submit()
>        linux-aio: add `dev_max_batch` parameter to laio_io_unplug()
> 
>   qapi/block-core.json       |   7 +++
>   include/block/raw-aio.h    |   6 ++-
>   block.c                    |  10 ++++
>   block/block-backend.c      |   2 +-
>   block/export/fuse.c        |   4 ++
>   block/file-posix.c         |  18 ++++++--
>   block/linux-aio.c          |  38 ++++++++++-----
>   block/nvme.c               |  22 +++++----
>   block/rbd.c                | 112 +++++++++++++++++++++++++++++++++++++++++++++
>   hw/ide/core.c              |   8 +++-
>   block/trace-events         |   2 +-
>   tests/qemu-iotests/085     |  31 ++++++++++++-
>   tests/qemu-iotests/085.out |  33 +++++++++++--
>   13 files changed, 258 insertions(+), 35 deletions(-)

Applied, thanks.

r~


