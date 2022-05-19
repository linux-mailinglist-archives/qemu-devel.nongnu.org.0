Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5952D515
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:51:20 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgYh-00022q-JF
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nrgVs-0007wc-CS
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nrgVi-00005S-Bj
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652968090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdcFdjAwIGN3Pi9dksSe2C7HrqYLOngQ2vSyOtgmRUU=;
 b=RzFt6TIcv+araqW4/WL6JH5jBm58xGuAsTrKdJ9VbNxog0f8OgMQczaDcLYMd5x9yI3OSQ
 uJxd7GvDDxAKefN2xISKAP1owzVT4RLOpx3tNIOnUqsNEiLsGssbJ0ZiAeWU6CanxLROD1
 1ZI1gkI7qMxbKFLeQFr+qHN8mPPM6mQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-qmrvy-UgNam7_lZk-LIXNA-1; Thu, 19 May 2022 09:48:09 -0400
X-MC-Unique: qmrvy-UgNam7_lZk-LIXNA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2d11b6259adso45962267b3.19
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 06:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FdcFdjAwIGN3Pi9dksSe2C7HrqYLOngQ2vSyOtgmRUU=;
 b=hO+AT4SKEAhvK6hdwTpOmOzy0DHAV7Ll16cqqRyzZ0kayWOOnhukUNBKRgJB2IXSCy
 jYOyTsuO03A7cfPgU8Ey5/avRj64w5SQwXXEKbvvkPRiu44y65eb9hxhaMnKvPbrLeqM
 10TgF96GxfXJ7EcnDq62Mtn9T5sgrmRR8xP/uqY8PUnEhXakz8PZyb1r7ZZQAw8NLRaF
 JNwifW5hb+2D/LHBWHKTVkKDnNoVnS/WphtxCkJPGQyoDJMf9ns8nvlFX4S4zdsoa1Xa
 dkb7hirtYeAmpt7lEuJcOfF1mJGfoag2PKFpygfE6P5ZFudXYA2/oHP9K/+COe6fiWIU
 IiHQ==
X-Gm-Message-State: AOAM5302f8i3j9CfQ7VCx2j2Z5gyASqzwVckFJGEG7qbs3krsXDoKVUy
 S8hKP7WE3s9LvCce6vcIohWE36hRqzQDlyIoCd8z7R8rzDVTSv887LLD7fquKfCuQ9jmawXNs3s
 1WToJk/psGf/FOUAG4iG00ATixWCJ6Zk=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr4993189ywn.33.1652968088642; 
 Thu, 19 May 2022 06:48:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgePAnl/7Q7tWXZVLt2c+DQ8hR1GGyeN/+L6br+HbgYTqFmD19uycxWHW8XWKZWB27jvFGGyK1TFZfEmWQOW8=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr4993160ywn.33.1652968088362; Thu, 19 May
 2022 06:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220519132745.1724-1-luzhipeng@cestc.cn>
In-Reply-To: <20220519132745.1724-1-luzhipeng@cestc.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 19 May 2022 15:47:57 +0200
Message-ID: <CAMxuvaz24PXxy2QRDkbud76VM9ohjOFy6V25ECZic4JfJpfLZg@mail.gmail.com>
Subject: Re: [PATCH v4] qga: add guest-get-diskstats command for Linux guests
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 19, 2022 at 3:28 PM luzhipeng <luzhipeng@cestc.cn> wrote:
>
> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be useful for getting io flow or handling
> IO fault, no need to enter guests.
>
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  Changes v3->v4: https://patchew.org/QEMU/20220515095437.1291-1-luzhipeng=
@cestc.cn/
>  Changes v2->v3: bugfix for memory leak
>  Changes v1->v2: v1:https://patchew.org/QEMU/20220512011930.214-1-luzhipe=
ng@cestc.cn/
>
>  qga/commands-posix.c | 123 +++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |   6 +++
>  qga/qapi-schema.json |  86 ++++++++++++++++++++++++++++++
>  3 files changed, 215 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..12b50b7124 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,122 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_=
info(Error **errp)
>      return info;
>  }
>
> +#define MAX_NAME_LEN 128
> +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> +{
> +#ifdef CONFIG_LINUX
> +    GuestDiskStatsInfoList *head =3D NULL, **tail =3D &head;
> +    const char *diskstats =3D "/proc/diskstats";
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(diskstats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        g_autofree GuestDiskStatsInfo *diskstatinfo =3D NULL;
> +        g_autofree GuestDiskStats *diskstat =3D NULL;
> +        char dev_name[MAX_NAME_LEN];
> +        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, f=
l_ticks;
> +        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, w=
r_ios;
> +        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +        unsigned int major, minor;
> +        int i;
> +
> +        i =3D sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                   &major, &minor, dev_name,
> +                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                   &fl_ios, &fl_ticks);
> +
> +        if (i < 7) {
> +            continue;
> B
> +        }
> +
> +        diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);
> +        diskstatinfo->name =3D g_strdup(dev_name);
> +        diskstatinfo->major =3D major;
> +        diskstatinfo->minor =3D minor;
> +
> +        diskstat =3D g_new0(GuestDiskStats, 1);
> +        if (i =3D=3D 7) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_merges_or_rd_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D rd_sec_or_wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D rd_ticks_or_wr_sec;
> +        }
> +        if (i >=3D 14) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_sec_or_wr_ios;
> +            diskstat->has_read_merges =3D true;
> +            diskstat->read_merges =3D rd_merges_or_rd_sec;
> +            diskstat->has_read_ticks =3D true;
> +            diskstat->read_ticks =3D rd_ticks_or_wr_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D wr_sec;
> +            diskstat->has_write_merges =3D true;
> +            diskstat->write_merges =3D wr_merges;
> +            diskstat->has_write_ticks =3D true;
> +            diskstat->write_ticks =3D wr_ticks;
> +            diskstat->has_ios_pgr =3D true;
> +            diskstat->ios_pgr =3D ios_pgr;
> +            diskstat->has_total_ticks =3D true;
> +            diskstat->total_ticks =3D tot_ticks;
> +            diskstat->has_weight_ticks =3D true;
> +            diskstat->weight_ticks =3D rq_ticks;
> +        }
> +        if (i >=3D 18) {
> +            diskstat->has_discard_ios =3D true;
> +            diskstat->discard_ios =3D dc_ios;
> +            diskstat->has_discard_merges =3D true;
> +            diskstat->discard_merges =3D dc_merges;
> +            diskstat->has_discard_sectors =3D true;
> +            diskstat->discard_sectors =3D dc_sec;
> +            diskstat->has_discard_ticks =3D true;
> +            diskstat->discard_ticks =3D dc_ticks;
> +        }
> +        if (i >=3D 20) {
> +            diskstat->has_flush_ios =3D true;
> +            diskstat->flush_ios =3D fl_ios;
> +            diskstat->has_flush_ticks =3D true;
> +            diskstat->flush_ticks =3D fl_ticks;
> +        }
> +
> +        diskstatinfo->stats =3D g_steal_pointer(&diskstat);
> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +        diskstatinfo =3D NULL;
> +    }
> +    free(line);
> +    fclose(fp);
> +    return head;
> +#else
> +    g_debug("disk stats reporting available only for Linux");
> +    return NULL;
> +#endif
> +}
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    return guest_get_diskstats(errp);
> +}
> +
>  #else /* defined(__linux__) */
>
>  void qmp_guest_suspend_disk(Error **errp)
> @@ -3131,6 +3247,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **err=
p)
>      return NULL;
>  }
>
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +
>  #endif /* CONFIG_FSFREEZE */
>
>  #if !defined(CONFIG_FSTRIM)
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index d56b5fd2a7..dcdeb76a68 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2532,3 +2532,9 @@ char *qga_get_host_name(Error **errp)
>
>      return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
>  }
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 4d8e506c9e..75d2bddf4b 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1490,3 +1490,89 @@
>  { 'command': 'guest-ssh-remove-authorized-keys',
>    'data': { 'username': 'str', 'keys': ['str'] },
>    'if': 'CONFIG_POSIX' }
> +
> +##
> +# @GuestDiskStats:
> +#
> +# @read-sectors: sectors read
> +#
> +# @write-sectors: sectors written
> +#
> +# @discard-sectors: sectors discarded
> +#
> +# @read-ios: reads completed successfully
> +#
> +# @read-merges: Number of read requests merged
> +#
> +# @write-ios: writes completed
> +#
> +# @write-merges: Number of write requests merged
> +#
> +# @discard-ios: Number of discards completed successfully
> +#
> +# @discard-merges: NUmber of discard requests merged
> +#
> +# @flush-ios: Number of flush requests completed successfully
> +#
> +# @read-ticks: time spent reading(ms)
> +#
> +# @write-ticks: time spent writing(ms)
> +#
> +# @discard-ticks: time spent discarding(ms)
> +#
> +# @flush-ticks: time spent flushing(ms)
> +#
> +# @ios-pgr: Number of I/Os currently in flight
> +#
> +# @total-ticks: time spent doing I/Os (ms)
> +#
> +# @weight-ticks: weighted time spent doing I/Os since the last update of=
 this field(ms)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestDiskStats',
> +  'data': {'*read-sectors': 'uint64',
> +           '*write-sectors': 'uint64',
> +           '*discard-sectors': 'uint64',
> +           '*read-ios': 'uint64',
> +           '*read-merges': 'uint64',
> +           '*write-ios': 'uint64',
> +           '*write-merges': 'uint64',
> +           '*discard-ios': 'uint64',
> +           '*discard-merges': 'uint64',
> +           '*flush-ios': 'uint64',
> +           '*read-ticks': 'uint64',
> +           '*write-ticks': 'uint64',
> +           '*discard-ticks': 'uint64',
> +           '*flush-ticks': 'uint64',
> +           '*ios-pgr': 'uint64',
> +           '*total-ticks': 'uint64',
> +           '*weight-ticks': 'uint64'
> +           } }
> +
> +##
> +# @GuestDiskStatsInfo:
> +#
> +# @name disk name
> +#
> +# @major major of disk
> +#
> +# @minor minor of disk
> +##
> +{ 'struct': 'GuestDiskStatsInfo',
> +  'data': {'name': 'str',
> +           'major': 'uint64',
> +           'minor': 'uint64',
> +           'stats': 'GuestDiskStats' } }
> +
> +##
> +# @guest-get-diskstats:
> +#
> +# Retrieve information about disk stats.
> +# Returns: List of disk stats of guest.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'guest-get-diskstats',
> +  'returns': ['GuestDiskStatsInfo']
> +}
> --
> 2.31.1
>
>
>


