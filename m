Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52854D858
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 04:30:00 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1fGh-00007m-5X
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 22:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1o1fFZ-0007Jg-41
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:28:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:42022
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1o1fFU-0002kq-Vo
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:28:48 -0400
HMM_SOURCE_IP: 172.18.0.218:33474.623171563
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 6420F2800DB;
 Thu, 16 Jun 2022 10:18:06 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id e8bf9b8f0e2a4bd5be830a12e7164da3 for
 steven.sistare@oracle.com; Thu, 16 Jun 2022 10:18:24 CST
X-Transaction-ID: e8bf9b8f0e2a4bd5be830a12e7164da3
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <dc6e5024-aa12-ac97-b85c-024688913edb@chinatelecom.cn>
Date: Thu, 16 Jun 2022 10:18:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Cc: tugy@chinatelecom.cn, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.226; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 2022/6/15 22:51, Steve Sistare wrote:
> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
> files and file descriptors.
> 
the function names should be updated.

--
Guoyi
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>   migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>   migration/qemu-file-channel.h |  6 ++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index bb5a575..cc5aebc 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -27,8 +27,10 @@
>   #include "qemu-file.h"
>   #include "io/channel-socket.h"
>   #include "io/channel-tls.h"
> +#include "io/channel-file.h"
>   #include "qemu/iov.h"
>   #include "qemu/yank.h"
> +#include "qapi/error.h"
>   #include "yank_functions.h"
>   
>   
> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>       object_ref(OBJECT(ioc));
>       return qemu_fopen_ops(ioc, &channel_output_ops, true);
>   }
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                          const char *name, Error **errp)
> +{
> +    g_autoptr(QIOChannelFile) fioc = NULL;
> +    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {
> +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
> +        return NULL;
> +    }
> +
> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
> +    if (!fioc) {
> +        return NULL;
> +    }
> +
> +    ioc = QIO_CHANNEL(fioc);
> +    qio_channel_set_name(ioc, name);
> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    return f;
> +}
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
> +{
> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    qio_channel_set_name(ioc, name);
> +    return f;
> +}
> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
> index 0028a09..75fd0ad 100644
> --- a/migration/qemu-file-channel.h
> +++ b/migration/qemu-file-channel.h
> @@ -29,4 +29,10 @@
>   
>   QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>   QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
> +
> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
> +                         const char *name, Error **errp);
> +
> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
> +
>   #endif

