Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB139F49C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:06:48 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZZH-0001fm-P1
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lqZY4-0000uH-44
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lqZXy-0005Gk-Pk
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623150324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NG+D6WhOtkOokriZ1kaJL4lbHoU9yzjkKJvEejr00aM=;
 b=aHAWom38TzRSJzdvEaKqF2SxsZmPzkeIKbTaS4XlNM6GqiBBeqnoXroccF+zVFo5gA1j2n
 25OhQqGujR6GLovr6uLiz1dZvxU6VLSRW7eIVrLN8CUGmqR/85GD/A5Tbb77g28iYPXiVo
 8IdbzlIXnBlPSPmNmllmriKM9HYjomk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-WVPbh2TIPCGdfu9QDXEgIg-1; Tue, 08 Jun 2021 07:05:23 -0400
X-MC-Unique: WVPbh2TIPCGdfu9QDXEgIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so608398wml.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NG+D6WhOtkOokriZ1kaJL4lbHoU9yzjkKJvEejr00aM=;
 b=Nm3eXg42yPE1eB8aKEWD5m63Xs1vdcH8Tf822nxtNPjouzfVBYkbgaM3HLPOmsKoud
 Iin/sKaFDK/GKK/fcnxOq1DlvXFeWGTO31ZAHhuQ/Lm2K9uevIza+VE0Sf/oRjh3QvtX
 JXZHwj5fvp7/30/gEzydZkOifJTYUfO2Xl0ruqjddoiHI3JIPtLRPmrRX8EtvW89UDHz
 dvXsjKj3QA4NIANXd0pzIZD9ojO4SG1ZaupwldN23/6kVrSqm14X2VZAS4ka9sceCvTU
 OkCUR+285oPFP4qzrudlWEctwH55w872mfleA+niHBV8Z3iFNw1IqBW9uWwlDJMRJNzs
 h3DQ==
X-Gm-Message-State: AOAM530ek+tUY7OZ5uQ/64v1P0zCTnRbgPha8oKuQXI/GWCUdjP4IulM
 rZ8aDukItXmls86pzGlcCvdPCoAMtH7ANklDHtog5MW3hmp16ITh8BbHCC89m5zEWBNQTkQdurb
 nhw3EcyKjdfzNOPw=
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr22146481wrs.246.1623150321947; 
 Tue, 08 Jun 2021 04:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3/dVS4fHbAM2BjTH4166lzSnPmG+uByffEoEtYnGVWK45M8JQvtU8OvePktSq7AITcShDVw==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr22146455wrs.246.1623150321682; 
 Tue, 08 Jun 2021 04:05:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 i21sm2416892wmq.12.2021.06.08.04.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 04:05:21 -0700 (PDT)
Subject: Re: [PATCH 8/9] virtiofsd: Optionally fill lo_inode.fhandle
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210604161337.16048-1-mreitz@redhat.com>
 <20210604161337.16048-9-mreitz@redhat.com> <YL9J2Oyjq2ok0/BM@work-vm>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <92ba88d8-46f3-ffd5-8a22-0c44f40bcc73@redhat.com>
Date: Tue, 8 Jun 2021 13:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL9J2Oyjq2ok0/BM@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.06.21 12:43, Dr. David Alan Gilbert wrote:
> * Max Reitz (mreitz@redhat.com) wrote:
>> When the inode_file_handles option is set, try to generate a file handle
>> for new inodes instead of opening an O_PATH FD.
>>
>> Being able to open these again will require CAP_DAC_READ_SEARCH, so the
>> description text tells the user they will also need to specify
>> -o modcaps=+dac_read_search.
>>
>> Generating a file handle returns the mount ID it is valid for.  Opening
>> it will require an FD instead.  We have mount_fds to map an ID to an FD.
>> get_file_handle() fills the hash map by opening the file we have
>> generated a handle for.  To verify that the resulting FD indeed
>> represents the handle's mount ID, we use statx().  Therefore, using file
>> handles requires statx() support.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tools/virtiofsd/helper.c              |   3 +
>>   tools/virtiofsd/passthrough_ll.c      | 170 ++++++++++++++++++++++++--
>>   tools/virtiofsd/passthrough_seccomp.c |   1 +
>>   3 files changed, 165 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
>> index 5e98ed702b..954f8639e6 100644
>> --- a/tools/virtiofsd/helper.c
>> +++ b/tools/virtiofsd/helper.c
>> @@ -186,6 +186,9 @@ void fuse_cmdline_help(void)
>>              "                               to virtiofsd from guest applications.\n"
>>              "                               default: no_allow_direct_io\n"
>>              "    -o announce_submounts      Announce sub-mount points to the guest\n"
>> +           "    -o inode_file_handles      Use file handles to reference inodes\n"
>> +           "                               instead of O_PATH file descriptors\n"
>> +           "                               (requires -o modcaps=+dac_read_search)\n"
>>              );
>>   }
>>   
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 793d2c333e..d01f9d3a59 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -190,6 +190,7 @@ struct lo_data {
>>       /* An O_PATH file descriptor to /proc/self/fd/ */
>>       int proc_self_fd;
>>       int user_killpriv_v2, killpriv_v2;
>> +    int inode_file_handles;
>>   };
>>   
>>   /**
>> @@ -244,6 +245,10 @@ static const struct fuse_opt lo_opts[] = {
>>       { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
>>       { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
>>       { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
>> +    { "inode_file_handles", offsetof(struct lo_data, inode_file_handles), 1 },
>> +    { "no_inode_file_handles",
>> +      offsetof(struct lo_data, inode_file_handles),
>> +      0 },
>>       FUSE_OPT_END
>>   };
>>   static bool use_syslog = false;
>> @@ -315,6 +320,108 @@ static int temp_fd_steal(TempFd *temp_fd)
>>       }
>>   }
>>   
>> +/**
>> + * Generate a file handle for the given dirfd/name combination.
>> + *
>> + * If mount_fds does not yet contain an entry for the handle's mount
>> + * ID, (re)open dirfd/name in O_RDONLY mode and add it to mount_fds
>> + * as the FD for that mount ID.  (That is the file that we have
>> + * generated a handle for, so it should be representative for the
>> + * mount ID.  However, to be sure (and to rule out races), we use
>> + * statx() to verify that our assumption is correct.)
>> + */
>> +static struct lo_fhandle *get_file_handle(struct lo_data *lo,
>> +                                          int dirfd, const char *name)
>> +{
>> +    /* We need statx() to verify the mount ID */
>> +#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
>> +    struct lo_fhandle *fh;
>> +    int ret;
>> +
>> +    if (!lo->use_statx || !lo->inode_file_handles) {
>> +        return NULL;
>> +    }
>> +
>> +    fh = g_new0(struct lo_fhandle, 1);
>> +
>> +    fh->handle.handle_bytes = sizeof(fh->padding) - sizeof(fh->handle);
>> +    ret = name_to_handle_at(dirfd, name, &fh->handle, &fh->mount_id,
>> +                            AT_EMPTY_PATH);
>> +    if (ret < 0) {
>> +        goto fail;
>> +    }
>> +
>> +    if (pthread_rwlock_rdlock(&mount_fds_lock)) {
>> +        goto fail;
>> +    }
>> +    if (!g_hash_table_contains(mount_fds, GINT_TO_POINTER(fh->mount_id))) {
>> +        struct statx stx;
>> +        int fd;
>> +
>> +        pthread_rwlock_unlock(&mount_fds_lock);
>> +
>> +        if (name[0]) {
>> +            fd = openat(dirfd, name, O_RDONLY);
> But can't that be a device file or other special file that you must not
> open?

Yes. So I think the right thing to do here is to use O_PATH (which 
should be safe), then statx() to find out what we need to know (now not 
only the mount ID, but the file type, too), and if it’s safe, we can 
then openat(proc_self_fd, str(fd), O_RDONLY) (and close the O_PATH fd).

If it isn’t safe, we just return an error, and the inode gets an O_PATH fd.

Max


