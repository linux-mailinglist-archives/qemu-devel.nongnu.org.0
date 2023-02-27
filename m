Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45BA6A3F66
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaci-0002kx-PA; Mon, 27 Feb 2023 05:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pWacN-0002gB-EZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:20:28 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pWacI-0003Qk-UC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:20:26 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:1fac:0:640:45b5:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2DB09601F9;
 Mon, 27 Feb 2023 13:19:58 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:18::1:1c] (unknown [2a02:6b8:b081:18::1:1c])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rJQOr00OheA0-bwpIfQoQ; Mon, 27 Feb 2023 13:19:56 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <99fa1aa1-4316-9fef-80b9-eaf5a1578654@yandex-team.ru>
Date: Mon, 27 Feb 2023 12:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US, ru-RU
From: Anton Kuchin <antonkuchin@yandex-team.ru>
To: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org> <Y/fZm12yGIPnwaDX@fedora>
 <f26f38f2-4168-88b3-37e9-09e5a604fad8@yandex-team.ru>
In-Reply-To: <f26f38f2-4168-88b3-37e9-09e5a604fad8@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 24/02/2023 06:14, Anton Kuchin wrote:
> On 23/02/2023 23:24, Stefan Hajnoczi wrote:
>> On Thu, Feb 23, 2023 at 02:36:33AM -0500, Michael S. Tsirkin wrote:
>>> On Wed, Feb 22, 2023 at 03:21:42PM -0500, Michael S. Tsirkin wrote:
>>>> On Wed, Feb 22, 2023 at 08:25:19PM +0200, Anton Kuchin wrote:
>>>>> On 22/02/2023 19:12, Michael S. Tsirkin wrote:
>>>>>> On Wed, Feb 22, 2023 at 07:05:47PM +0200, Anton Kuchin wrote:
>>>>>>> On 22/02/2023 18:51, Michael S. Tsirkin wrote:
>>>>>>>> On Wed, Feb 22, 2023 at 06:49:10PM +0200, Anton Kuchin wrote:
>>>>>>>>> On 22/02/2023 17:14, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>>> On 22.02.23 17:25, Anton Kuchin wrote:
>>>>>>>>>>>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +    VHostUserFS *fs = opaque;
>>>>>>>>>>>>>> +    g_autofree char *path = 
>>>>>>>>>>>>>> object_get_canonical_path(OBJECT(fs));
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    switch (fs->migration_type) {
>>>>>>>>>>>>>> +    case VHOST_USER_MIGRATION_TYPE_NONE:
>>>>>>>>>>>>>> +        error_report("Migration is blocked by device 
>>>>>>>>>>>>>> %s", path);
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
>>>>>>>>>>>>>> +        return 0;
>>>>>>>>>>>>>> +    default:
>>>>>>>>>>>>>> +        error_report("Migration type '%s' is not
>>>>>>>>>>>>>> supported by device %s",
>>>>>>>>>>>>>> + VhostUserMigrationType_str(fs->migration_type), path);
>>>>>>>>>>>>>> +        break;
>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    return -1;
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>> Should we also add this as .pre_load, to force user select
>>>>>>>>>>>>> correct migration_type on target too?
>>>>>>>>>>>> In fact, I would claim we only want pre_load.
>>>>>>>>>>>> When qemu is started on destination we know where it's 
>>>>>>>>>>>> migrated
>>>>>>>>>>>> from so this flag can be set.
>>>>>>>>>>>> When qemu is started on source we generally do not yet know so
>>>>>>>>>>>> we don't know whether it's safe to set this flag.
>>>>>>>>>> But destination is a "source" for next migration, so there 
>>>>>>>>>> shouldn't be
>>>>>>>>>> real difference.
>>>>>>>>>> The new property has ".realized_set_allowed = true", so, as I 
>>>>>>>>>> understand
>>>>>>>>>> it may be changed at any time, so that's not a problem.
>>>>>>>>> Yes, exactly. So destination's property sets not how it will 
>>>>>>>>> handle this
>>>>>>>>> incoming
>>>>>>>>> migration but the future outgoing one.
>>>>>>>> How do you know where you are going to migrate though?
>>>>>>>> I think you don't.
>>>>>>>> Setting it on source is better since we know where we
>>>>>>>> are migrating from.
>>>>>>> Yes, I don't know where I'm going to migrate to. This is why 
>>>>>>> property
>>>>>>> affects only how source saves state on outgoing migration.
>>>>>> Um. I don't get the logic.
>>>>> For this feature to work we need orchestrator to manage the 
>>>>> migration. And
>>>>> we
>>>>> generally assume that it is responsibility of orchestrator to ensure
>>>>> matching
>>>>> properties on source and destination.
>>>>> As orchestrator manages both sides of migration it can set option 
>>>>> (and we
>>>>> can
>>>>> check it) on either source or destination. Now it's not important 
>>>>> which side
>>>>> we
>>>>> select, because now the option is essentially binary allow/deny 
>>>>> (but IMHO it
>>>>> is much better to refuse source to migrate than find later that 
>>>>> state can't
>>>>> be
>>>>> loaded by destination, in case of file migration this becomes 
>>>>> especially
>>>>> painful).
>>>>>
>>>>> But there are plans to add internal migration option (extract FUSE 
>>>>> state
>>>>> from
>>>>> backend and transfer it in QEMU migration stream), and that's where
>>>>> setting/checking
>>>>> on source becomes important because it will rely on this property 
>>>>> to decide
>>>>> if
>>>>> extra state form backend needs to be put in the migration stream 
>>>>> subsection.
>>>>
>>>> If we do internal migration that will be a different property
>>>> which has to match on source *and* destination.
>>>>
>>>>
>>>>> If you are concerned about orchestrator breaking assumption of 
>>>>> matching
>>>>> properties
>>>>> on source and destination this is not really supported AFAIK but I 
>>>>> don't
>>>>> think we
>>>>> need to punish it for this, maybe it has its reasons: I can 
>>>>> imagine scenario
>>>>> where orchestrator could want to migrate from source with
>>>>> 'migration=external'
>>>>> to destination with 'migration=none' to ensure that destination 
>>>>> can't be
>>>>> migrated further.
>>>> No. I am concerned about a simple practical matter:
>>>> - I decide to restart qemu on the same host - so I need to enable
>>>>    migration
>>>> - Later I decide to migrate qemu to another host - this should be
>>>>    blocked
>>>>
>>>>
>>>> Property on source does not satisfy both at the same time.
>>>> Property on destination does.
>>>
>>> Stefan what's your take on this? Should we move this from
>>> save to load hook?
>> This property can be changed on the source at runtime via qom-set, so
>> you don't need to predict the future. The device can be started from an
>> incoming migration with "external" and then set to "stateful" migration
>> to migrate to another host later on.
>>
>> Anton, can you share the virtiofsd patches so we have a full picture of
>> how "external" migration works? I'd like to understand the workflow and
>> also how it can be extended when "stateful" migration is added.
>
> Unfortunately internal implementation is relying heavily on our 
> infrastructure,
> and rust virtiofsd still lacks dirty tracking so it is not ready yet. 
> But I did
> have a PoC for deprecated now C virtiofsd that I didn't bother to prepare
> for upstreaming because C version was declared unsupported. It 
> essentially adds
> reconnect and this was the only thing required from virtiofsd to support
> migration via file.
>
> If this helps I'll try to find patches or recreate then and will be 
> happy to share.


Found my stash with PoC. It has some TODOs and needs more work to become 
submission
quality, but I hope this can be helpful to show the idea.

I checked it with file migration on the same host to update qemu binary 
like this:
  1. Run tools/virtiofsd/virtiofsd with "--reconnect" flag
  2. Run src qemu VM with vhost-user-fs device
  3. Mount fs in guest and run fio with verification on test file in 
shared directory
  4. Command via QMP to migrate VM to file
  5. Run dst qemu VM with vhost-user-fs device and "-incoming defer" flag
  6. Command via QMP to load migration stream from file and continue VM
  7. Check that fio keeps running in guest with no errors

[PATCH] tools/virtiofsd: reconnect PoC

Keep daemon listening after disconnect so session can be continued
after VM is restored.

Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
  tools/virtiofsd/fuse_lowlevel.h       |  1 +
  tools/virtiofsd/fuse_virtio.c         | 59 +++++++++++++++++----------
  tools/virtiofsd/helper.c              |  1 +
  tools/virtiofsd/passthrough_ll.c      | 49 ++++++++++++++++------
  tools/virtiofsd/passthrough_seccomp.c | 12 +++++-
  tools/virtiofsd/passthrough_seccomp.h |  2 +-
  6 files changed, 87 insertions(+), 37 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.h 
b/tools/virtiofsd/fuse_lowlevel.h
index b889dae4de..d5f3bf05ba 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1795,6 +1795,7 @@ struct fuse_cmdline_opts {
      int log_level;
      unsigned int max_idle_threads;
      unsigned long rlimit_nofile;
+    int reconnect;
  };

  /**
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 9368e292e4..64782cd78d 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -837,6 +837,7 @@ static const VuDevIface fv_iface = {
  int virtio_loop(struct fuse_session *se)
  {
      fuse_log(FUSE_LOG_INFO, "%s: Entry\n", __func__);
+    int ret = 0;

      while (!fuse_session_exited(se)) {
          struct pollfd pf[1];
@@ -858,7 +859,13 @@ int virtio_loop(struct fuse_session *se)
              break;
          }
          assert(poll_res == 1);
-        if (pf[0].revents & (POLLERR | POLLHUP | POLLNVAL)) {
+        if (pf[0].revents & POLLHUP) {
+            fuse_log(FUSE_LOG_ERR, "%s: Client disconnected: %x\n", 
__func__,
+                     pf[0].revents);
+            ret = -1;
+            break;
+        }
+        if (pf[0].revents & (POLLERR | POLLNVAL)) {
              fuse_log(FUSE_LOG_ERR, "%s: Unexpected poll revents %x\n", 
__func__,
                       pf[0].revents);
              break;
@@ -885,7 +892,7 @@ int virtio_loop(struct fuse_session *se)
      stop_all_queues(se->virtio_dev);
      fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);

-    return 0;
+    return ret;
  }

  static void strreplace(char *s, char old, char new)
@@ -1015,25 +1022,31 @@ int virtio_session_mount(struct fuse_session *se)
  {
      int ret;

-    /*
-     * Test that unshare(CLONE_FS) works. fv_queue_worker() will need 
it. It's
-     * an unprivileged system call but some Docker/Moby versions are 
known to
-     * reject it via seccomp when CAP_SYS_ADMIN is not given.
-     *
-     * Note that the program is single-threaded here so this syscall has no
-     * visible effect and is safe to make.
-     */
-    ret = unshare(CLONE_FS);
-    if (ret == -1 && errno == EPERM) {
-        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_FS) failed with EPERM. If "
-                "running in a container please check that the container "
-                "runtime seccomp policy allows unshare.\n");
-        return -1;
-    }

-    ret = fv_create_listen_socket(se);
-    if (ret < 0) {
-        return ret;
+    if (se->vu_listen_fd == -1) {
+        fuse_log(FUSE_LOG_INFO, "listenfd is closed. set it up\n");
+        /*
+         * Test that unshare(CLONE_FS) works. fv_queue_worker() will 
need it. It's
+         * an unprivileged system call but some Docker/Moby versions 
are known to
+         * reject it via seccomp when CAP_SYS_ADMIN is not given.
+         *
+         * Note that the program is single-threaded here so this 
syscall has no
+         * visible effect and is safe to make.
+         */
+        ret = unshare(CLONE_FS);
+        if (ret == -1 && errno == EPERM) {
+            fuse_log(FUSE_LOG_ERR, "unshare(CLONE_FS) failed with 
EPERM. If "
+                    "running in a container please check that the 
container "
+                    "runtime seccomp policy allows unshare.\n");
+            return -1;
+        }
+
+        ret = fv_create_listen_socket(se);
+        if (ret < 0) {
+            return ret;
+        }
+    } else {
+        fuse_log(FUSE_LOG_INFO, "listenfd is open. reconnecting\n");
      }

      se->fd = -1;
@@ -1046,8 +1059,8 @@ int virtio_session_mount(struct fuse_session *se)
          close(se->vu_listen_fd);
          return -1;
      }
-    close(se->vu_listen_fd);
-    se->vu_listen_fd = -1;
+
+    /* TODO: close vu_listen_fd here if not reconnect */
      fuse_log(FUSE_LOG_INFO, "%s: Received vhost-user socket connection\n",
               __func__);

@@ -1068,6 +1081,8 @@ int virtio_session_mount(struct fuse_session *se)

  void virtio_session_close(struct fuse_session *se)
  {
+    /* TODO: vu_listen_fd can be closed in session_mount */
+    close(se->vu_listen_fd);
      close(se->vu_socketfd);

      if (!se->virtio_dev) {
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index f5f66f292c..236a58f109 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -53,6 +53,7 @@ static const struct fuse_opt fuse_helper_opts[] = {
      FUSE_HELPER_OPT_VALUE("log_level=info", log_level, FUSE_LOG_INFO),
      FUSE_HELPER_OPT_VALUE("log_level=warn", log_level, FUSE_LOG_WARNING),
      FUSE_HELPER_OPT_VALUE("log_level=err", log_level, FUSE_LOG_ERR),
+    FUSE_HELPER_OPT_VALUE("--reconnect", reconnect, 0),
      FUSE_OPT_END
  };

diff --git a/tools/virtiofsd/passthrough_ll.c 
b/tools/virtiofsd/passthrough_ll.c
index 40ea2ed27f..487d320c70 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3819,7 +3819,7 @@ static void setup_wait_parent_capabilities(void)
  /*
   * Move to a new mount, net, and pid namespaces to isolate this process.
   */
-static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
+static void setup_namespaces(struct lo_data *lo, struct fuse_session 
*se, bool enable_reconnect)
  {
      pid_t child;

@@ -3829,12 +3829,21 @@ static void setup_namespaces(struct lo_data *lo, 
struct fuse_session *se)
       * is also needed so that we can remount /proc for the new pid
       * namespace.
       *
-     * Our UNIX domain sockets have been created.  Now we can move to
-     * an empty network namespace to prevent TCP/IP and other network
-     * activity in case this process is compromised.
+     * Our UNIX domain sockets have been created. If we don't need 
reconnect
+     * now we can move to an empty network namespace to prevent TCP/IP and
+     * other network activity in case this process is compromised.
+     *
+     * TODO: Need to double-check if this is necessary. Looks like unix 
sockets
+     * can be shared across network namespaces. Maybe it is better if 
socket can
+     * be created in new namespace (but before we forbid listen with 
seccomp).
       */
-    if (unshare(CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET) != 0) {
-        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS): 
%m\n");
+    int unshare_flags = CLONE_NEWPID | CLONE_NEWNS;
+    if (!enable_reconnect) {
+        unshare_flags |= CLONE_NEWNET;
+    }
+    if (unshare(unshare_flags) != 0) {
+        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS%s): 
%m\n",
+                 enable_reconnect ? " | CLONE_NEWNET" : "");
          exit(1);
      }

@@ -4146,16 +4155,16 @@ static void setup_chroot(struct lo_data *lo)
   * source directory.  This reduces the impact of arbitrary code 
execution bugs.
   */
  static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
-                          bool enable_syslog)
+                          bool enable_syslog, bool enable_reconnect)
  {
      if (lo->sandbox == SANDBOX_NAMESPACE) {
-        setup_namespaces(lo, se);
+        setup_namespaces(lo, se, enable_reconnect);
          setup_mounts(lo->source);
      } else {
          setup_chroot(lo);
      }

-    setup_seccomp(enable_syslog);
+    setup_seccomp(enable_syslog, enable_reconnect);
      setup_capabilities(g_strdup(lo->modcaps));
  }

@@ -4500,13 +4509,27 @@ int main(int argc, char *argv[])
      /* Must be before sandbox since it wants /proc */
      setup_capng();

-    setup_sandbox(&lo, se, opts.syslog);
+    setup_sandbox(&lo, se, opts.syslog, opts.reconnect);

      setup_root(&lo, &lo.root);
-    /* Block until ctrl+c or fusermount -u */
-    ret = virtio_loop(se);
+    do {
+        /* TODO: this loop should be like {mount-loop-unmount} but setup of
+         * listen descriptor happens in mount and will fail after 
sandboxing.
+         * Need to extract setup to virtio_session_new where we can create
+         * socket before sandboxing and in session_mount only accept 
client.*/
+        /* Block until ctrl+c, fusermount -u or client disconnect */
+        ret = virtio_loop(se);
+        fuse_log(FUSE_LOG_ERR, "ret is %d, %s\n", ret,
+                 ret ? "reconnecting" : "terminating");
+        fuse_session_unmount(se);
+        if (ret) {
+            if (fuse_session_mount(se) != 0) {
+                fuse_log(FUSE_LOG_ERR, "failed to remount\n");
+                goto err_out3;
+            }
+        }
+    } while (opts.reconnect && !ret);

-    fuse_session_unmount(se);
      cleanup_capng();
  err_out3:
      fuse_remove_signal_handlers(se);
diff --git a/tools/virtiofsd/passthrough_seccomp.c 
b/tools/virtiofsd/passthrough_seccomp.c
index 0033dab493..8dd773a062 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -129,6 +129,11 @@ static const int syscall_allowlist_syslog[] = {
      SCMP_SYS(sendto),
  };

+/* Allow accept to handle client reconnect */
+static const int syscall_allowlist_reconnect[] = {
+    SCMP_SYS(accept),
+};
+
  static void add_allowlist(scmp_filter_ctx ctx, const int syscalls[], 
size_t len)
  {
      size_t i;
@@ -142,7 +147,7 @@ static void add_allowlist(scmp_filter_ctx ctx, const 
int syscalls[], size_t len)
      }
  }

-void setup_seccomp(bool enable_syslog)
+void setup_seccomp(bool enable_syslog, bool enable_reconnect)
  {
      scmp_filter_ctx ctx;

@@ -166,6 +171,11 @@ void setup_seccomp(bool enable_syslog)
                        G_N_ELEMENTS(syscall_allowlist_syslog));
      }

+    if (enable_reconnect) {
+        add_allowlist(ctx, syscall_allowlist_reconnect,
+ G_N_ELEMENTS(syscall_allowlist_reconnect));
+    }
+
      /* libvhost-user calls this for post-copy migration, we don't need 
it */
      if (seccomp_rule_add(ctx, SCMP_ACT_ERRNO(ENOSYS),
                           SCMP_SYS(userfaultfd), 0) != 0) {
diff --git a/tools/virtiofsd/passthrough_seccomp.h 
b/tools/virtiofsd/passthrough_seccomp.h
index 12674fc050..bec47b114c 100644
--- a/tools/virtiofsd/passthrough_seccomp.h
+++ b/tools/virtiofsd/passthrough_seccomp.h
@@ -9,6 +9,6 @@
  #ifndef VIRTIOFSD_PASSTHROUGH_SECCOMP_H
  #define VIRTIOFSD_PASSTHROUGH_SECCOMP_H

-void setup_seccomp(bool enable_syslog);
+void setup_seccomp(bool enable_syslog, bool enable_reconnect);

  #endif /* VIRTIOFSD_PASSTHROUGH_SECCOMP_H */
-- 
2.37.2


>
>>
>>>>
>>>>>>
>>>>>>>>>>> This property selects if VM can migrate and if it can what 
>>>>>>>>>>> should
>>>>>>>>>>> qemu put
>>>>>>>>>>> to the migration stream. So we select on source what type of
>>>>>>>>>>> migration is
>>>>>>>>>>> allowed for this VM, destination can't check anything at 
>>>>>>>>>>> load time.
>>>>>>>>>> OK, so the new field "migration" regulates only outgoing 
>>>>>>>>>> migration and
>>>>>>>>>> do nothing for incoming. On incoming migration the migration 
>>>>>>>>>> stream
>>>>>>>>>> itself defines the type of device migration.
>>>>>>>>>> Worth mentioning in doc?
>>>>>>>>> Good point. I don't think this deserves a respin but if I have 
>>>>>>>>> to send v4
>>>>>>>>> I'll include
>>>>>>>>> clarification in it.

