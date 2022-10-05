Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A45F5156
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 11:06:37 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og0MN-00079V-N2
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 05:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1og0JF-0005W0-6r
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 05:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1og0Ix-0000tq-Ub
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 05:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664960583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCMPBA9e7724YAMVwcvTHnuhr6IQT7g+RM8asMNTfjw=;
 b=fuDs89lw72yFr5ltbJw2+9uEzq9D49mLMnHVq4xkno/9F9b4uA3kOqJX76gYxFRpItqs4E
 We9zki28AGFjCT0RflmdUCRhzwsssw29LcC5IRUIv0aKnrTP9CEj2aSLuhnEdLxXYWbsIN
 31pDylCUmUUKjXV+Z3Y5k1ZN9AIZu0c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-r-K9-uGPP5GKYW257NBNpw-1; Wed, 05 Oct 2022 05:02:59 -0400
X-MC-Unique: r-K9-uGPP5GKYW257NBNpw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so218890wmi.3
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 02:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=OCMPBA9e7724YAMVwcvTHnuhr6IQT7g+RM8asMNTfjw=;
 b=7z3PYIfFxvQDR57+JHYoT3ibwRL6o5Exco68eYXGen2K+hTGyav1HpEeMQFrUQQdUN
 biUW69Kp+XiQG64/zkboypm+V0HGraSLq2oJygxP/xseLqEV/ZmaPqZSVsRSSOMb1A00
 CO8adiVwBOXy1fOuHEcES6ZR7Ofod6acmzmkablxKXt/BWRf1rVncMygOLP7HNGVoQ0L
 OMg87Swe1iJQDrUZIkzDoqw1DG1/J2mI4uUc2DlKNqbgfIdJh/UxKsNTLSM2P5wNt2jt
 QR0OiPDIy50gdMyVTnx8+svUuQD/JwJL+Ni/FskU5b1BUMW3F9XPevRGllrY+UUYqz36
 vgiQ==
X-Gm-Message-State: ACrzQf0Vykh2YoOBHsnqqm0xPdTrU14rsgRSJFgX+FWbNTl+ka2GG1Dr
 a77wCxl6P+SNjI9Rq7DP125er/8x8ybURcHpFe3OE+gngXLcPKOd4icE3vF2QKqbztERGas97Hg
 zue9NCHLGrcuYnBI=
X-Received: by 2002:a05:6000:1cf:b0:22e:3ef1:a268 with SMTP id
 t15-20020a05600001cf00b0022e3ef1a268mr8119263wrx.43.1664960573483; 
 Wed, 05 Oct 2022 02:02:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ggby1Sonvr6NPJtfZLZbisZXuVVxZNt2UEzDPGYV6Pb6Iw/EtoBbEkviExpPHtdT40Op5tA==
X-Received: by 2002:a05:6000:1cf:b0:22e:3ef1:a268 with SMTP id
 t15-20020a05600001cf00b0022e3ef1a268mr8119227wrx.43.1664960573186; 
 Wed, 05 Oct 2022 02:02:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 az26-20020adfe19a000000b0022cd59331b2sm14774538wrb.95.2022.10.05.02.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 02:02:51 -0700 (PDT)
Message-ID: <33d7599c-0759-baf7-5e98-dacdf8b3ccf5@redhat.com>
Date: Wed, 5 Oct 2022 11:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v2 13/15] vfio/iommufd: Implement the iommufd backend
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Cc: alex.williamson@redhat.com, cohuck@redhat.com,
 david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, nicolinc@nvidia.com, eric.auger.pro@gmail.com,
 kevin.tian@intel.com, chao.p.peng@intel.com, yi.y.sun@intel.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
References: <20220608123139.19356-1-yi.l.liu@intel.com>
 <20220608123139.19356-14-yi.l.liu@intel.com> <87zgecqdv1.fsf@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87zgecqdv1.fsf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.449, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alister,
On 10/4/22 08:47, Alistair Popple wrote:
> Yi Liu <yi.l.liu@intel.com> writes:
>
> [...]
>
>> +static int vfio_get_devicefd(const char *sysfs_path, Error **errp)
>> +{
>> +    long int ret = -ENOTTY;
>> +    char *path, *vfio_dev_path = NULL, *vfio_path = NULL;
>> +    DIR *dir;
>> +    struct dirent *dent;
>> +    gchar *contents;
>> +    struct stat st;
>> +    gsize length;
>> +    int major, minor;
>> +    dev_t vfio_devt;
>> +
>> +    path = g_strdup_printf("%s/vfio-device", sysfs_path);
>> +    if (stat(path, &st) < 0) {
>> +        error_setg_errno(errp, errno, "no such host device");
>> +        goto out_free_path;
>> +    }
>> +
>> +    dir = opendir(path);
>> +    if (!dir) {
>> +        error_setg_errno(errp, errno, "couldn't open dirrectory %s", path);
>> +        goto out_free_path;
>> +    }
>> +
>> +    while ((dent = readdir(dir))) {
>> +        if (!strncmp(dent->d_name, "vfio", 4)) {
>> +            vfio_dev_path = g_strdup_printf("%s/%s/dev", path, dent->d_name);
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!vfio_dev_path) {
>> +        error_setg(errp, "failed to find vfio-device/vfioX/dev");
>> +        goto out_free_path;
>> +    }
>> +
>> +    if (!g_file_get_contents(vfio_dev_path, &contents, &length, NULL)) {
>> +        error_setg(errp, "failed to load \"%s\"", vfio_dev_path);
>> +        goto out_free_dev_path;
>> +    }
>> +
>> +    if (sscanf(contents, "%d:%d", &major, &minor) != 2) {
>> +        error_setg(errp, "failed to get major:mino for \"%s\"", vfio_dev_path);
>> +        goto out_free_dev_path;
>> +    }
>> +    g_free(contents);
>> +    vfio_devt = makedev(major, minor);
>> +
>> +    vfio_path = g_strdup_printf("/dev/vfio/devices/%s", dent->d_name);
>> +    ret = open_cdev(vfio_path, vfio_devt);
>> +    if (ret < 0) {
>> +        error_setg(errp, "Failed to open %s", vfio_path);
>> +    }
>> +
>> +    trace_vfio_iommufd_get_devicefd(vfio_path, ret);
>> +    g_free(vfio_path);
>> +
>> +out_free_dev_path:
>> +    g_free(vfio_dev_path);
>> +out_free_path:
>> +    g_free(path);
>> +
>> +    if (*errp) {
>> +        error_prepend(errp, VFIO_MSG_PREFIX, path);
> I ran into this while trying to get things running, so haven't reviewed
> the patch but noticed path is used after it's freed if !!*errp.

thank you for the bug report! We will fix that on the next iteration.

Eric
>
>  - Alistair
>
>> +    }
>> +    return ret;
>> +}


