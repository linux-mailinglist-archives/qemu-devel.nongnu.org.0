Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B74F7CAC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 12:24:54 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncPJs-0001EE-VD
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncPFX-0000MZ-Dz
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:20:25 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncPFU-0000DN-Vr
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:20:22 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id l14so8731756ybe.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i/gXCSQAvC2H9jOtooDSiH6zB/h+Szxjo+xam5JcAaI=;
 b=lLkJ/hPBcu/37w4UM5tyxNePsGglo4SDHoCFu5wAydICfhfmWQwexfTNG5CPJa+u1C
 ACXawTj7TApSHQsEGAX/Tqgv4m++h3zt5Dk+E8kIO/Jd+8kcVDC3ykx4mROPGyJaj7ro
 mMdSIVZk5I0yEJCjGvgKxPpZzjBHhTZB9IdZqJmAedFJTG4suIE0LFG3l5TfHgdmGqHL
 /AQUJfBB/yVAO5vna3rlZZmpo0G536bX9O71u6sJskKnEKryk/jF+AqWU3Y90EH0zP2d
 WvHIZsy7HYbT9UUSA5SAwAMozeU1xhF/gRs9YAa6WR8ZaKZtc+thB0ZwdloAXlpymHvs
 BcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i/gXCSQAvC2H9jOtooDSiH6zB/h+Szxjo+xam5JcAaI=;
 b=5sFuH+W3g+8I/rkglqygouA6r4lzviSTEotvvBA4zqgjGlt3OpskyvSkqWyvd8xBJm
 uEyjlbPJu3/kT/I6Q/rwD3TlJCsnAk4Fd5bjpgOP948/b7DV4yFajodlXe2PvIPt+2t4
 q6OAJ/L3eAq7/fQMR2+CBmcEjwb8KLsdGILVtmuI2yiWl51Pj2OnHXi+EZlKh5uMEKJj
 bQGZfyClA0ao/TwrCNXL3VN/wdQr51zfVu7BOtdYXoSJjJSIzhBsmlvc7Kn9yt9vKg/E
 8oQu2Xy8tayHlRTSvl/WzDVb95Qg8QlqPunfEdEMz8A/lw3bWhW9raRqBPG9Y7+TiAFP
 7xPw==
X-Gm-Message-State: AOAM532XmuQ5SBkVTnY19dizS4uhurj3ybHthNm/d3w16EJZ0jKzjnhS
 2CK6P2N9xZeL2/4TMBe8CJx5U49BIXiA24GpHPe7SA==
X-Google-Smtp-Source: ABdhPJxNV6TEVNnbd0LB6BsKVADNZ7vdlW1EBkeZs/WG+FSuqjXDhWpJKoTw1R6KXObZRwlYzbUxIaJ5a1uQZRB8csk=
X-Received: by 2002:a25:418c:0:b0:63d:84a2:2364 with SMTP id
 o134-20020a25418c000000b0063d84a22364mr9556261yba.85.1649326819720; Thu, 07
 Apr 2022 03:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220217172500.60500-1-dgilbert@redhat.com>
 <20220217172500.60500-10-dgilbert@redhat.com>
In-Reply-To: <20220217172500.60500-10-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 11:20:08 +0100
Message-ID: <CAFEAcA9m2U2fcUYXpRJwt09UgGqDA2K3BDt1xgXZL63jc1EWEQ@mail.gmail.com>
Subject: Re: [PULL 09/12] virtiofsd: Create new file with security context
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: slp@redhat.com, sebastian.hasler@stuvus.uni-stuttgart.de,
 qemu-devel@nongnu.org, groug@kaod.org, virtio-fs@redhat.com,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 17:40, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: Vivek Goyal <vgoyal@redhat.com>
>
> This patch adds support for creating new file with security context
> as sent by client. It basically takes three paths.
>
> - If no security context enabled, then it continues to create files without
>   security context.
>
> - If security context is enabled and but security.selinux has not been
>   remapped, then it uses /proc/thread-self/attr/fscreate knob to set
>   security context and then create the file. This will make sure that
>   newly created file gets the security context as set in "fscreate" and
>   this is atomic w.r.t file creation.
>
>   This is useful and host and guest SELinux policies don't conflict and
>   can work with each other. In that case, guest security.selinux xattr
>   is not remapped and it is passthrough as "security.selinux" xattr
>   on host.
>
> - If security context is enabled but security.selinux xattr has been
>   remapped to something else, then it first creates the file and then
>   uses setxattr() to set the remapped xattr with the security context.
>   This is a non-atomic operation w.r.t file creation.
>
>   This mode will be most versatile and allow host and guest to have their
>   own separate SELinux xattrs and have their own separate SELinux policies.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Message-Id: <20220208204813.682906-9-vgoyal@redhat.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Hi; Coverity reports some issues (CID 1487142, 1487195), because
it is not a fan of the error-handling pattern used in this code:

> +static int do_mknod_symlink_secctx(fuse_req_t req, struct lo_inode *dir,
> +                                   const char *name, const char *secctx_name)
> +{
> +    int path_fd, err;
> +    char procname[64];
> +    struct lo_data *lo = lo_data(req);
> +
> +    if (!req->secctx.ctxlen) {
> +        return 0;
> +    }
> +
> +    /* Open newly created element with O_PATH */
> +    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
> +    err = path_fd == -1 ? errno : 0;
> +    if (err) {
> +        return err;
> +    }

We set err based on whether path_fd is -1 or not, but we decide
whether to early-return based on the value of err. Coverity
doesn't know that openat() will always set errno to something
non-zero if it returns -1, so it complains because it thinks
there's a code path where openat() returns -1, but errno is 0,
and so we don't take the early-return and instead continue
through all the code below to the "close(path_fd)", which
should not be being passed a negative value for the filedescriptor.

I could just mark these as false-positives, but it does seem a bit
odd that we are using two different conditions here. Perhaps it would
be better to rephrase? For instance, for the openat() we could write:

   path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
   if (path_fd == -1) {
       return errno;
   }
and similarly for the openat() in open_set_proc_fscreate().

> +    sprintf(procname, "%i", path_fd);
> +    FCHDIR_NOFAIL(lo->proc_self_fd);
> +    /* Set security context. This is not atomic w.r.t file creation */
> +    err = setxattr(procname, secctx_name, req->secctx.ctx, req->secctx.ctxlen,
> +                   0);
> +    if (err) {
> +        err = errno;
> +    }

> +    FCHDIR_NOFAIL(lo->root.fd);
> +    close(path_fd);
> +    return err;
> +}

thanks
-- PMM

