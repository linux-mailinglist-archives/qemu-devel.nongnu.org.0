Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204F52A4C3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:26:03 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy9C-0006KQ-Il
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nqwXT-0006SA-O9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nqwXQ-00053S-14
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652791372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/TypBHb34jmQ4deg031wa4WRkV21SWIjIgE4wQbNts=;
 b=V5aXiLxIMf9HnAVulTNW6ZspHEkKnHdLkJQztU8//YiIpJ8qlx9cG/6b5KHqg2BSWS/eD+
 +QuG8eTDcPIyqZApEzqtjUXPxzLMD3sC9/pwstzJCGU9UVP8OwuvAqvEq6VQo5hWEJZNQS
 TkCVdmJBO6DGuw0I0gwskJl/ZA5qE5M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-JPKjF7VtOlGT4Jr8MeEUaA-1; Tue, 17 May 2022 08:42:51 -0400
X-MC-Unique: JPKjF7VtOlGT4Jr8MeEUaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso1199534wmc.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 05:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e/TypBHb34jmQ4deg031wa4WRkV21SWIjIgE4wQbNts=;
 b=GzP4PbS6iOn2FgRuNQICZlxBxtsqEeAjYMsvdwQ53zpvoRG0J4M0yMH9RaRUErES5j
 6NhUuKaDLRNBx24eSp8X4b3uBcNglqePIVDZ9aC7lVljRsEVj7zQRo2va5WAK7tvNHHi
 yoP5AuWYe6kwgF1LVrl0o5puSMvYmyTFH4wo1nrC6yzpTaIT9DJRVjBBlPQCI4AFIBpq
 UFNkIuSEkBs21ZME+Yk0pggn0MWcxVwCiGb+2KwmogJ+iA2IYAeibqCQ58jZcQWUQyS7
 AtlWZYdQNBQV0NFAq+EFjt4fIdbMDl9Yob+fU0zRk7S/VwUiTA7cykn4QWCzF8+W+FQp
 08Nw==
X-Gm-Message-State: AOAM530mfo5PNsFeVNO1rGm8lNqNL/rCjc+ezRTql/98bzOir6IjyXv5
 YJOvOCImf20+z2Gdqpr7SVFPSkhKwNjQjyDkc24s/Vg9CXuhC6T4w4rHKQ72ElHcHV+o45cvxyG
 hjk2LFWzP+zVQ78s=
X-Received: by 2002:a5d:6806:0:b0:20d:db6:5462 with SMTP id
 w6-20020a5d6806000000b0020d0db65462mr6220169wru.246.1652791369815; 
 Tue, 17 May 2022 05:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx21GviNl/yCFYdY4VNsW+4prUGbTNjLuajEPoE6raTu+kpAtsxPBRYfTJ0j+EtK30zpxx4ig==
X-Received: by 2002:a5d:6806:0:b0:20d:db6:5462 with SMTP id
 w6-20020a5d6806000000b0020d0db65462mr6220143wru.246.1652791369440; 
 Tue, 17 May 2022 05:42:49 -0700 (PDT)
Received: from [10.43.2.180] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x26-20020adfae1a000000b0020c5253d8fdsm12204038wrc.73.2022.05.17.05.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 05:42:48 -0700 (PDT)
Message-ID: <f681ca61-d87e-2b9d-9e04-0c23ef589545@redhat.com>
Date: Tue, 17 May 2022 14:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] qga: add guest-get-diskstats command for Linux guests
Content-Language: en-US
To: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220515095437.1291-1-luzhipeng@cestc.cn>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220515095437.1291-1-luzhipeng@cestc.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/15/22 11:54, luzhipeng wrote:
> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be usefull for getting io flow or handling
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

Couple of points, see below:

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..1d89be8a83 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,98 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>      return info;
>  }
>  
> +#define MAX_NAME_LEN 128
> +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> +{
> +#ifdef CONFIG_LINUX
> +    GuestDiskStatsInfoList *head = NULL, **tail = &head;
> +    const char *diskstats = "/proc/diskstats";
> +    FILE *fp;
> +    size_t n;
> +    char *line = NULL;
> +    char dev_name[MAX_NAME_LEN];
> +    int i;
> +    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
> +    unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
> +    unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +    unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +    unsigned int major, minor;

Nearly all these variables are used solely inside the while() loop below. Might be worth moving them there so decrease clutter here.

> +
> +    fp = fopen(diskstats, "r");
> +    if (fp  == NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +    while (getline(&line, &n, fp) != -1) {
> +        GuestDiskStatsInfo *diskstatinfo;
> +        GuestDiskStats *diskstat;

Empty line after variable declaration block please.

Also, if these are declared as g_autofree, then you don't need to free them explicitly in every error path.

> +        i = sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                  &major, &minor, dev_name,
> +                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                  &fl_ios, &fl_ticks);
> +
> +        diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
> +        diskstat = g_new0(GuestDiskStats, 1);
> +        if (i < 7) {
> +            g_free(diskstat);
> +            g_free(diskstatinfo);
> +            continue;
> +        }

How about checking whether i < 7 and only after it wasn't allocating memory?

> +        diskstatinfo->name = g_strdup(dev_name);
> +        diskstatinfo->major = major;
> +        diskstatinfo->minor = minor;
> +        if (i == 7) {
> +            diskstat->read_ios = rd_ios;
> +            diskstat->read_sectors = rd_merges_or_rd_sec;
> +            diskstat->write_ios = rd_sec_or_wr_ios;
> +            diskstat->write_sectors = rd_ticks_or_wr_sec;
> +        }
> +        if (i >= 14) {
> +            diskstat->read_ios = rd_ios;
> +            diskstat->read_sectors = rd_sec_or_wr_ios;
> +            diskstat->read_merges = rd_merges_or_rd_sec;
> +            diskstat->read_ticks = rd_ticks_or_wr_sec;
> +            diskstat->write_ios = wr_ios;
> +            diskstat->write_sectors = wr_sec;
> +            diskstat->write_merges = wr_merges;
> +            diskstat->write_ticks = wr_ticks;
> +            diskstat->ios_pgr = ios_pgr;
> +            diskstat->total_ticks = tot_ticks;
> +            diskstat->weight_ticks = rq_ticks;
> +        }
> +        if (i >= 18) {
> +            diskstat->discard_ios = dc_ios;
> +            diskstat->discard_merges = dc_merges;
> +            diskstat->discard_sectors = dc_sec;
> +            diskstat->discard_ticks = dc_ticks;
> +        }
> +        if (i >= 20) {
> +            diskstat->flush_ios = fl_ios;
> +            diskstat->flush_ticks = fl_ticks;
> +        }
> +

So this is best effort and some variables are going to be unset. I think we should give callers a chance to differentiate whether zero value they are seeing is a result of us parsing zero in sscanf() above OR whether we just did not bother filling the value.

> +        diskstatinfo->stats = diskstat;

If you go with g_autofree as suggested above then this could just be:

  diskstatinfo->stats = g_steal_pointer(&diskstat);

> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +    }
> +    g_free(line);
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
> @@ -3131,6 +3223,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
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
> +# @weight-ticks: weighted time spent doing I/Os since the last update of this field(ms)
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

These don't seem to be aligned. Anyway, I think we should make them all optional.


Here's the diff with my suggestions. Feel free to squash it in:


diff --git c/qga/commands-posix.c w/qga/commands-posix.c
index 1d89be8a83..64084f2408 100644
--- c/qga/commands-posix.c
+++ w/qga/commands-posix.c
@@ -2792,76 +2792,99 @@ static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
     FILE *fp;
     size_t n;
     char *line = NULL;
-    char dev_name[MAX_NAME_LEN];
-    int i;
-    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
-    unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
-    unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
-    unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
-    unsigned int major, minor;
 
     fp = fopen(diskstats, "r");
     if (fp  == NULL) {
         error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
         return NULL;
     }
+
     while (getline(&line, &n, fp) != -1) {
-        GuestDiskStatsInfo *diskstatinfo;
-        GuestDiskStats *diskstat;
+        g_autofree GuestDiskStatsInfo *diskstatinfo = NULL;
+        g_autofree GuestDiskStats *diskstat = NULL;
+        char dev_name[MAX_NAME_LEN];
+        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
+        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
+        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
+        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
+        unsigned int major, minor;
+        int i;
+
         i = sscanf(line, "%u %u %s %lu %lu %lu"
                    "%lu %lu %lu %lu %u %u %u %u"
                    "%lu %lu %lu %u %lu %u",
-                  &major, &minor, dev_name,
-                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
-                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
-                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
-                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
-                  &fl_ios, &fl_ticks);
+                   &major, &minor, dev_name,
+                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
+                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
+                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
+                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
+                   &fl_ios, &fl_ticks);
+
+        if (i < 7)
+            continue;
 
         diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
-        diskstat = g_new0(GuestDiskStats, 1);
-        if (i < 7) {
-            g_free(diskstat);
-            g_free(diskstatinfo);
-            continue;
-        }
         diskstatinfo->name = g_strdup(dev_name);
         diskstatinfo->major = major;
         diskstatinfo->minor = minor;
+
+        diskstat = g_new0(GuestDiskStats, 1);
         if (i == 7) {
+            diskstat->has_read_ios = true;
             diskstat->read_ios = rd_ios;
+            diskstat->has_read_sectors = true;
             diskstat->read_sectors = rd_merges_or_rd_sec;
+            diskstat->has_write_ios = true;
             diskstat->write_ios = rd_sec_or_wr_ios;
+            diskstat->has_write_sectors = true;
             diskstat->write_sectors = rd_ticks_or_wr_sec;
         }
         if (i >= 14) {
+            diskstat->has_read_ios = true;
             diskstat->read_ios = rd_ios;
+            diskstat->has_read_sectors = true;
             diskstat->read_sectors = rd_sec_or_wr_ios;
+            diskstat->has_read_merges = true;
             diskstat->read_merges = rd_merges_or_rd_sec;
+            diskstat->has_read_ticks = true;
             diskstat->read_ticks = rd_ticks_or_wr_sec;
+            diskstat->has_write_ios = true;
             diskstat->write_ios = wr_ios;
+            diskstat->has_write_sectors = true;
             diskstat->write_sectors = wr_sec;
+            diskstat->has_write_merges = true;
             diskstat->write_merges = wr_merges;
+            diskstat->has_write_ticks = true;
             diskstat->write_ticks = wr_ticks;
+            diskstat->has_ios_pgr = true;
             diskstat->ios_pgr = ios_pgr;
+            diskstat->has_total_ticks = true;
             diskstat->total_ticks = tot_ticks;
+            diskstat->has_weight_ticks = true;
             diskstat->weight_ticks = rq_ticks;
         }
         if (i >= 18) {
+            diskstat->has_discard_ios = true;
             diskstat->discard_ios = dc_ios;
+            diskstat->has_discard_merges = true;
             diskstat->discard_merges = dc_merges;
+            diskstat->has_discard_sectors = true;
             diskstat->discard_sectors = dc_sec;
+            diskstat->has_discard_ticks = true;
             diskstat->discard_ticks = dc_ticks;
         }
         if (i >= 20) {
+            diskstat->has_flush_ios = true;
             diskstat->flush_ios = fl_ios;
+            diskstat->has_flush_ticks = true;
             diskstat->flush_ticks = fl_ticks;
         }
 
-        diskstatinfo->stats = diskstat;
+        diskstatinfo->stats = g_steal_pointer(&diskstat);
         QAPI_LIST_APPEND(tail, diskstatinfo);
+        diskstatinfo = NULL;
     }
-    g_free(line);
+    free(line);
     fclose(fp);
     return head;
 #else
diff --git c/qga/qapi-schema.json w/qga/qapi-schema.json
index 94aad4f2ae..75d2bddf4b 100644
--- c/qga/qapi-schema.json
+++ w/qga/qapi-schema.json
@@ -1531,23 +1531,23 @@
 # Since: 7.1
 ##
 { 'struct': 'GuestDiskStats',
-  'data': {'read-sectors': 'uint64',
-            'write-sectors': 'uint64',
-            'discard-sectors': 'uint64',
-            'read-ios': 'uint64',
-            'read-merges': 'uint64',
-            'write-ios': 'uint64',
-            'write-merges': 'uint64',
-            'discard-ios': 'uint64',
-            'discard-merges': 'uint64',
-            'flush-ios': 'uint64',
-            'read-ticks': 'uint64',
-            'write-ticks': 'uint64',
-            'discard-ticks': 'uint64',
-            'flush-ticks': 'uint64',
-            'ios-pgr': 'uint64',
-            'total-ticks': 'uint64',
-            'weight-ticks': 'uint64'
+  'data': {'*read-sectors': 'uint64',
+           '*write-sectors': 'uint64',
+           '*discard-sectors': 'uint64',
+           '*read-ios': 'uint64',
+           '*read-merges': 'uint64',
+           '*write-ios': 'uint64',
+           '*write-merges': 'uint64',
+           '*discard-ios': 'uint64',
+           '*discard-merges': 'uint64',
+           '*flush-ios': 'uint64',
+           '*read-ticks': 'uint64',
+           '*write-ticks': 'uint64',
+           '*discard-ticks': 'uint64',
+           '*flush-ticks': 'uint64',
+           '*ios-pgr': 'uint64',
+           '*total-ticks': 'uint64',
+           '*weight-ticks': 'uint64'
            } }
 
 ##


