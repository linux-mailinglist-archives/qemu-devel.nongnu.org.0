Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B652A3B6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:43:17 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxTp-0006EK-1h
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nqvfN-0004Qa-Jc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nqvfI-0004aZ-Ak
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652788018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTmVot7fUa59gcrfJwuXTydPxHd/JtjFeMStLuPhG5k=;
 b=A/ZuCIQ+ruwMix6jQkhbRW4hq0723hi07tpGd/HtGtWElfWTJVPL9glQCtnf4B+TnhXZDF
 YzkItINCVMRKoXcVFRL1oUCZpS7xGo70YGp1+YDb/ayl4AH0aIR1EUrPk0BIQCzomvToJR
 ixxks9R+Xb8PcsCw/Xx7gTCV7iyhJ6A=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-8ZxD0m7LPu2aMfbZ4n5WnQ-1; Tue, 17 May 2022 07:46:57 -0400
X-MC-Unique: 8ZxD0m7LPu2aMfbZ4n5WnQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 x3-20020a25b3c3000000b0064e03a85ccbso946332ybf.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aTmVot7fUa59gcrfJwuXTydPxHd/JtjFeMStLuPhG5k=;
 b=Dg27V74Gya+04eXsHsH6KIA+zJJEGlV0oeNry1RddcfxDPpf/8G5QMLwnGjgruOsnf
 DEvjKBP/Ei75ymld377i9u9P1GcqgiXTLb3KPxxc9AMMfEsWWBw327GRPYixLUWbWYId
 924Uu+oC8yOcOLupvv31ozlRLy84WXTC99I3zB4InfaVRpGfoFUuEpkY7Af0l8Fo+fIp
 oxbb9uW4EsqtJ/uEYy+H0+GgSuz+WSirhnte01hzULQX07w2/6Jc0RzmiYeoeRt6GBvi
 AXOj1WoKtlSkNlvnUEJC7R8/Ti+5sWPJBhqz/5Xlq2kluXEV4EYi+CTDVyQrYirLZjd1
 zsMQ==
X-Gm-Message-State: AOAM5317jf99ee1Nu5bAatk5jjPz0tBnRg3q8V3PaaQl9QdoZGHCIyzS
 hP/vuNcaz5ToVvufJ9ycqWyYyJp26qhc84UoFzkAVXWrGf9J2cUTQW3nMgvJFcrC8/VOhaEE5zo
 yGrD79AdZPWO3WgG9w9UjyG3a8kIci+0=
X-Received: by 2002:a81:5245:0:b0:2fe:f0f0:d0f6 with SMTP id
 g66-20020a815245000000b002fef0f0d0f6mr11790177ywb.312.1652788017238; 
 Tue, 17 May 2022 04:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN3Xf8QYWZfKbWFSLePJMlFQlECE+cKBIcVDT4dd3ju6GsWiVlaOvYrAyRukSrYfmcWwGeoRVBZI7uBqeR8FQ=
X-Received: by 2002:a81:5245:0:b0:2fe:f0f0:d0f6 with SMTP id
 g66-20020a815245000000b002fef0f0d0f6mr11790157ywb.312.1652788017005; Tue, 17
 May 2022 04:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220515095437.1291-1-luzhipeng@cestc.cn>
In-Reply-To: <20220515095437.1291-1-luzhipeng@cestc.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 17 May 2022 13:46:45 +0200
Message-ID: <CAMxuvax0yDWV22E5VXH4AAyPGZJBxo+9khYcs-Sv76S9e=tppA@mail.gmail.com>
Subject: Re: [PATCH v3] qga: add guest-get-diskstats command for Linux guests
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

Hi

On Sun, May 15, 2022 at 11:55 AM luzhipeng <luzhipeng@cestc.cn> wrote:
>
> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be usefull for getting io flow or handling

useful

> IO fault, no need to enter guests.
>
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
> ---
> Changes v2->v3:
>  bugfix for memory leak
> Changes v1->v2:
>  v1:https://patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/
>
>  qga/commands-posix.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |  6 +++
>  qga/qapi-schema.json | 86 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 191 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..1d89be8a83 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,98 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_i=
nfo(Error **errp)
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
> +    char dev_name[MAX_NAME_LEN];
> +    int i;
> +    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ti=
cks;
> +    unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_io=
s;
> +    unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +    unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +    unsigned int major, minor;
> +
> +    fp =3D fopen(diskstats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        GuestDiskStatsInfo *diskstatinfo;
> +        GuestDiskStats *diskstat;
> +        i =3D sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                  &major, &minor, dev_name,
> +                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                  &fl_ios, &fl_ticks);
> +
> +        diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);
> +        diskstat =3D g_new0(GuestDiskStats, 1);
> +        if (i < 7) {
> +            g_free(diskstat);
> +            g_free(diskstatinfo);
> +            continue;
> +        }
> +        diskstatinfo->name =3D g_strdup(dev_name);
> +        diskstatinfo->major =3D major;
> +        diskstatinfo->minor =3D minor;
> +        if (i =3D=3D 7) {
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->read_sectors =3D rd_merges_or_rd_sec;
> +            diskstat->write_ios =3D rd_sec_or_wr_ios;
> +            diskstat->write_sectors =3D rd_ticks_or_wr_sec;
> +        }
> +        if (i >=3D 14) {
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->read_sectors =3D rd_sec_or_wr_ios;
> +            diskstat->read_merges =3D rd_merges_or_rd_sec;
> +            diskstat->read_ticks =3D rd_ticks_or_wr_sec;
> +            diskstat->write_ios =3D wr_ios;
> +            diskstat->write_sectors =3D wr_sec;
> +            diskstat->write_merges =3D wr_merges;
> +            diskstat->write_ticks =3D wr_ticks;
> +            diskstat->ios_pgr =3D ios_pgr;
> +            diskstat->total_ticks =3D tot_ticks;
> +            diskstat->weight_ticks =3D rq_ticks;
> +        }
> +        if (i >=3D 18) {
> +            diskstat->discard_ios =3D dc_ios;
> +            diskstat->discard_merges =3D dc_merges;
> +            diskstat->discard_sectors =3D dc_sec;
> +            diskstat->discard_ticks =3D dc_ticks;
> +        }
> +        if (i >=3D 20) {
> +            diskstat->flush_ios =3D fl_ios;
> +            diskstat->flush_ticks =3D fl_ticks;
> +        }
> +
> +        diskstatinfo->stats =3D diskstat;
> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +    }
> +    g_free(line);

You shouldn't mix glib allocation with libc. Please use free() for "line"..

lgtm otherwise
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

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
> @@ -3131,6 +3223,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **err=
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
> index 4d8e506c9e..94aad4f2ae 100644
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
> +  'data': {'read-sectors': 'uint64',
> +            'write-sectors': 'uint64',
> +            'discard-sectors': 'uint64',
> +            'read-ios': 'uint64',
> +            'read-merges': 'uint64',
> +            'write-ios': 'uint64',
> +            'write-merges': 'uint64',
> +            'discard-ios': 'uint64',
> +            'discard-merges': 'uint64',
> +            'flush-ios': 'uint64',
> +            'read-ticks': 'uint64',
> +            'write-ticks': 'uint64',
> +            'discard-ticks': 'uint64',
> +            'flush-ticks': 'uint64',
> +            'ios-pgr': 'uint64',
> +            'total-ticks': 'uint64',
> +            'weight-ticks': 'uint64'
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


